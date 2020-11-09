//
//  LoginViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtField: TextFieldIconView!
    @IBOutlet weak var passwordTxtField: TextFieldIconView!
    @IBOutlet weak var btnLogin: RoundEdgeButtonView!
    @IBOutlet weak var btnAppleLogin: RoundEdgeButtonView!
    @IBOutlet weak var btnFBLogin: RoundEdgeButtonView!
    
    private var socialAuth = SocialAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        passwordTxtField.isSecureText = true
        btnLogin.onTap = onLogin
        btnFBLogin.onTap = onFBLogin
        btnAppleLogin.onTap = onAppleLogin
    }
    
    func onLogin() {
        loginAPI()
    }
    
    func onFBLogin() {
        socialAuth.facebookSignIn(vc: self).done { (result) in
            //login success
            UserDataManager().setToken(token: result.data.token)
            UserDataManager().setUserData(user: result.data.user)
            //TODO:
            //temporary go to Home
            Helper.goToHomeScreen()
        }.catch { (error) in
            let errorMessage = Helper.parseErrorMessage(error: error)
            Helper.showAlert(vc: self, title: "", message: errorMessage.message)
        }
    }
    
    func onAppleLogin() {
        socialAuth.appleSignIn(vc: self) { (id, email, firstName, lastName, error) in
            //TODO: which api to use?
            print("")
        }
    }

    @IBAction func onBtnForgotPassword(_ sender: Any) {
        if let errorMsg = FormValidator.emailErrorMessage(email: emailTxtField.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "", message: errorMsg)
        } else {
            APISession().forgotPassword(input: ForgotPasswordAPIParam(email: emailTxtField.txtText.text!.trim())).done { (result) in
                Helper.showAlert(vc: self, title: "Forgot Password", message: result.data?.message ?? "Failed to send email")
            }.catch { (error) in
                let errorMessage = Helper.parseErrorMessage(error: error)
                Helper.showAlert(vc: self, title: "Forgot Password", message: errorMessage.message)
            }
        }
    }
    
    @IBAction func onBtnSignUp(_ sender: Any) {        
        let vc = RegisterViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == emailTxtField.txtText) {
            passwordTxtField.txtText.becomeFirstResponder()
        } else if (textField == passwordTxtField.txtText) {
            loginAPI()
        }
        return true
    }
}

//MARK: - API
extension LoginViewController {
    func valid() -> Bool {
        if let errorMsg = FormValidator.emailErrorMessage(email: emailTxtField.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "", message: errorMsg)
            return false
        }
        if let errorMsg = FormValidator.passwordErrorMessage(password: passwordTxtField.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "", message: errorMsg)
            return false
        }
        return true
    }
    
    func loginAPI() {
        if (valid()) {
            let email = emailTxtField.txtText.text!.trim()
            let pass = passwordTxtField.txtText.text!.trim()
            APISession().signIn(input: SignInParam(email: email, password: pass)).done { (res) in
                UserDataManager().setToken(token: res.data.token)
                UserDataManager().setUserData(user: res.data.user)
                if GeneralDataManager().isAppAlreadyRun() {
                    //not a fresh install
                    //go to home screen
                    Helper.goToHomeScreen()
                } else {
                    let vc = SubscriptionViewController.initFromNib()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }.catch { (error) in
                let err = error as! ErrorMessage
                Helper.showAlert(vc: self, title: "", message: err.message)
            }
        }
    }
}
