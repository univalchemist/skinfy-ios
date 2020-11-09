//
//  LastNameViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class LastNameViewController: UIViewController {

    @IBOutlet weak var btnNext: RoundEdgeButtonView!
    @IBOutlet weak var lastNameTxtField: TextFieldIconView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastNameTxtField.txtText.autocapitalizationType = .sentences
        lastNameTxtField.txtText.delegate = self
        btnNext.onTap = onBtnNext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lastNameTxtField.txtText.becomeFirstResponder()
    }
    
    func onBtnNext() {
        if (valid()) {
            GeneralDataManager().set(value: lastNameTxtField.txtText.text!.trim(), forKey: ConstantKeys.LastName)
            registerAPI()
        }
    }
    
    func valid() -> Bool {
        let lastName = lastNameTxtField.txtText.text!.trim()
        if let error = FormValidator.nameErrorMessage(name: lastName) {
            Helper.showAlert(vc: self, title: "", message: error)
            return false
        }
        return true
    }
    
    func goToNextScreen() {
        if GeneralDataManager().isAppAlreadyRun() {
            Helper.goToHomeScreen()
        } else {
            let vc = SubscriptionViewController.initFromNib()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension LastNameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onBtnNext()
        return true
    }
}

extension LastNameViewController {
    func registerAPI() {
        let generalDataMan = GeneralDataManager()
        let userName = generalDataMan.value(forKey: ConstantKeys.FirstName) as? String ?? ""
        let firstName = generalDataMan.value(forKey: ConstantKeys.FirstName) as? String ?? ""
        let lastName = generalDataMan.value(forKey: ConstantKeys.LastName) as? String ?? ""
        let email = generalDataMan.value(forKey: ConstantKeys.Email) as? String ?? ""
        let password = generalDataMan.value(forKey: ConstantKeys.Password) as? String ?? ""
        APISession().signUp(input: SignUpParam(username: userName, email: email, password: password, firstName: firstName, lastName: lastName, avatar: nil)).done { (signUpResult) in
            //success registration
            UserDataManager().setToken(token: signUpResult.data.token)
            UserDataManager().setUserData(user: signUpResult.data.user)            
            self.goToNextScreen()
        }.catch { (error) in
            let err = error as! ErrorMessage
            Helper.showAlert(vc: self, title: "", message: err.message)
        }
    }
}
