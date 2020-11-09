//
//  RegisterViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/16/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTxtField: TextFieldIconView!
    
    @IBOutlet weak var passwordTxtField: TextFieldIconView!
    
    @IBOutlet weak var confirmPasswordTxtField: TextFieldIconView!
    
    @IBOutlet weak var btnSignUp: RoundEdgeButtonView!
    
    @IBOutlet weak var btnSignUpFB: RoundEdgeButtonView!
    
    @IBOutlet weak var btnSignUpApple: RoundEdgeButtonView!
    
    private var socialAuth = SocialAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        confirmPasswordTxtField.delegate = self
        passwordTxtField.isSecureText = true
        confirmPasswordTxtField.isSecureText = true
     
        btnSignUp.onTap = onSignUp
        btnSignUpFB.onTap = onSignUpFB
        btnSignUpApple.onTap = onSignUpApple
    }
    
    @IBAction func onBtnLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func onSignUp() {
        checkEmailAPI()
    }
    
    @objc func onSignUpFB() {
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
    
    @objc func onSignUpApple() {
        socialAuth.appleSignIn(vc: self) { (id, email, firstName, lastName, error) in
            //TODO: which api to use?
            print("")
        }
    }

}

//MARK: - Text Field Delegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == emailTxtField.txtText) {
            passwordTxtField.txtText.becomeFirstResponder()
        } else if (textField == passwordTxtField.txtText) {
            confirmPasswordTxtField.txtText.becomeFirstResponder()
        } else if (textField == confirmPasswordTxtField.txtText) {
            checkEmailAPI()
        }
        return true
    }
}

//MARK: - API
extension RegisterViewController {
    func valid() -> Bool {
        if let errorMsg = FormValidator.emailErrorMessage(email: emailTxtField.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "", message: errorMsg)
            return false
        }
        if let errorMsg = FormValidator.passwordConfirmErrorMessage(password: passwordTxtField.txtText.text!.trim(), confirmPassword: confirmPasswordTxtField.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "", message: errorMsg)
            return false
        }
        
        return true
    }
    
    func checkEmailAPI() {
        if (valid()) {
            GeneralDataManager().set(value: emailTxtField.txtText.text!.trim(), forKey: ConstantKeys.Email)
            GeneralDataManager().set(value: passwordTxtField.txtText.text!.trim(), forKey: ConstantKeys.Password)
            APISession().emailExist(input: CheckExistEmailParam(email: emailTxtField.txtText.text!.trim())).done { (response) in
                if response.data.isExist {
                    Helper.showAlert(vc: self, title: "", message: "Email already registered")
                } else {
                    //OK To register
                    self.goToFirstNameScreen()
                }
            }.catch { (error) in
                let err = error as! ErrorMessage
                Helper.showAlert(vc: self, title: "", message: err.message)
            }
        }
    }
    
    func goToFirstNameScreen() {
        let vc = FirstNameViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
}
