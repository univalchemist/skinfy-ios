//
//  ChangePasswordViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var txtFieldCurrentPassword: TextFieldIconView!
    @IBOutlet weak var txtFieldNewPassword: TextFieldIconView!
    @IBOutlet weak var txtFieldConfirmPassword: TextFieldIconView!
    @IBOutlet weak var btnChangePassword: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        
        txtFieldCurrentPassword.delegate = self
        txtFieldNewPassword.delegate = self
        txtFieldConfirmPassword.delegate = self
        txtFieldCurrentPassword.returnKeyType = UIReturnKeyType.next.rawValue
        txtFieldNewPassword.returnKeyType = UIReturnKeyType.next.rawValue
        txtFieldConfirmPassword.returnKeyType = UIReturnKeyType.go.rawValue
        
        btnChangePassword.onTap = onBtnChangePassword
    }
    
    @objc func onBack() {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onBtnChangePassword() {
        if (valid()) {
            changePasswordAPI()
        }
    }
    
    func valid() -> Bool {
        if let error = FormValidator.passwordErrorMessage(password: txtFieldCurrentPassword.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "Error", message: error)
            return false
        }
        if let error = FormValidator.passwordErrorMessage(password: txtFieldNewPassword.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "Error", message: error)
            return false
        }
        if let error = FormValidator.passwordErrorMessage(password: txtFieldConfirmPassword.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "Error", message: error)
            return false
        }
        if let error = FormValidator.passwordConfirmErrorMessage(password: txtFieldNewPassword.txtText.text!.trim(), confirmPassword: txtFieldConfirmPassword.txtText.text!.trim()) {
            Helper.showAlert(vc: self, title: "Error", message: error)
            return false
        }
        
        return true
    }

}

//MARK: - Text Field Delegate
extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == txtFieldCurrentPassword.txtText) {
            txtFieldNewPassword.txtText.becomeFirstResponder()
        } else if (textField == txtFieldNewPassword.txtText) {
            txtFieldConfirmPassword.txtText.becomeFirstResponder()
        } else if (textField == txtFieldConfirmPassword.txtText) {
            onBtnChangePassword()
        }
        return true
    }
}

//MARK: - APIs
extension ChangePasswordViewController {
    func changePasswordAPI() {
        APISession().changePassword(input: ChangePasswordAPIParam(oldPassword: txtFieldCurrentPassword.txtText.text!.trim(), password: txtFieldNewPassword.txtText.text!.trim())).done { (result) in
            //success
            self.txtFieldCurrentPassword.txtText.text = ""
            self.txtFieldNewPassword.txtText.text = ""
            self.txtFieldConfirmPassword.txtText.text = ""
            Helper.showAlert(vc: self, title: "Success", message: "Password Changed Successfully")
        }.catch { (error) in
            let errorMessage = Helper.parseErrorMessage(error: error)
            Helper.showAlert(vc: self, title: "Error", message: errorMessage.message)
        }
    }
}
