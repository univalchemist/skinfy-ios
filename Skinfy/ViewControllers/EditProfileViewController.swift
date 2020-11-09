//
//  EditProfileViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var btnSave: RoundEdgeButtonView!
    @IBOutlet weak var txtFieldFirstName: TextFieldIconView!
    @IBOutlet weak var txtFieldLastName: TextFieldIconView!
    @IBOutlet weak var txtFieldEmail: TextFieldIconView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        
        btnSave.onTap = onTapSave
        
        txtFieldFirstName.delegate = self
        txtFieldLastName.delegate = self
        txtFieldEmail.isEnabled = false
        txtFieldFirstName.returnKeyType = UIReturnKeyType.next.rawValue
        txtFieldLastName.returnKeyType = UIReturnKeyType.go.rawValue
        
        let userData = UserDataManager().userData()!
        txtFieldFirstName.txtText.text = userData.firstName!
        txtFieldLastName.txtText.text = userData.lastName!
        txtFieldEmail.txtText.text = userData.email
    }
    
    @objc func onBtnBack() {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popViewController(animated: true)
    }
    
    func valid() -> Bool {
        let firstName = txtFieldFirstName.txtText.text?.trim()
        let lastName = txtFieldLastName.txtText.text?.trim()
        if let errorFirstName = FormValidator.firstNameErrorMessage(name: firstName!) {
            Helper.showAlert(vc: self, title: "Error", message: errorFirstName)
            //revert back
            txtFieldFirstName.txtText.text = UserDataManager().userData()?.firstName
            return false
        }
        if let errorLastName = FormValidator.lastNameErrorMessage(name: lastName!) {
            Helper.showAlert(vc: self, title: "Error", message: errorLastName)
            //revert back
            txtFieldLastName.txtText.text = UserDataManager().userData()?.lastName
            return false
        }
        return true
    }
    
    func onTapSave() {
        if (valid()) {
            editProfileAPI()
        }
    }

}

//MARK: - Text Field Delegate
extension EditProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == txtFieldFirstName.txtText) {
            txtFieldLastName.txtText.becomeFirstResponder()
        } else if (textField == txtFieldLastName.txtText) {
            onTapSave()
        }
        return true
    }
}

//MARK: - APIs
extension EditProfileViewController {
    func editProfileAPI() {
        APISession().editProfile(input: EditProfileAPIParam(firstName: txtFieldFirstName.txtText.text?.trim(), lastName: txtFieldLastName.txtText.text?.trim(), email: nil)).done { (result) in
            //success
            //update cached user data
            var userData = UserDataManager().userData()
            userData?.firstName = self.txtFieldFirstName.txtText.text!
            userData?.lastName = self.txtFieldLastName.txtText.text!
            UserDataManager().setUserData(user: userData!)
        }.catch { (error) in
            let errorMessage = Helper.parseErrorMessage(error: error)
            Helper.showAlert(vc: self, title: "Error", message: errorMessage.message)
        }
    }
}
