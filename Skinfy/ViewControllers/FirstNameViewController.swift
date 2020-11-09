//
//  FirstNameViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class FirstNameViewController: UIViewController {

    @IBOutlet weak var firstNameTxtField: TextFieldIconView!
    @IBOutlet weak var btnNext: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTxtField.txtText.autocapitalizationType = .sentences
        firstNameTxtField.txtText.delegate = self
        btnNext.onTap = onBtnNext
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstNameTxtField.txtText.becomeFirstResponder()
    }

    func onBtnNext() {
        if (valid()) {
            GeneralDataManager().set(value: firstNameTxtField.txtText.text!.trim(), forKey: ConstantKeys.FirstName)            
            let vc = LastNameViewController.initFromNib()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func valid() -> Bool {
        let firstName = firstNameTxtField.txtText.text!.trim()
        if let error = FormValidator.nameErrorMessage(name: firstName) {
            Helper.showAlert(vc: self, title: "", message: error)
            return false
        }
        return true
    }
    
}

extension FirstNameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        onBtnNext()
        return true
    }
}
