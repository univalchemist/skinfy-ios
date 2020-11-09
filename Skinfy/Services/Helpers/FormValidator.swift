//
//  FormValidator.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class FormValidator {
    
    static func emailErrorMessage(email: String) -> String? {
        if (!TextInputValidator.isEmailValid(email: email)) {
            return "Invalid Email"
        }
        return nil
    }
    
    static func passwordErrorMessage(password: String) -> String? {
        if (!TextInputValidator.isPasswordValid(password: password)) {
            return "Password should be at least 6 characters"
        }
        return nil
    }
    
    static func passwordConfirmErrorMessage(password: String, confirmPassword: String) -> String? {
        if let error = passwordErrorMessage(password: password) {
            return error
        }
        if let error = passwordErrorMessage(password: confirmPassword) {
            return error
        }
        if password != confirmPassword {
            return "Passwords doesn't match"
        }
        return nil
    }
    
    static func nameErrorMessage(name: String) -> String? {
        if (!TextInputValidator.isNameValid(name: name)) {
            return "Invalid Name"
        }
        return nil
    }
    
    static func firstNameErrorMessage(name: String) -> String? {
        if (!TextInputValidator.isNameValid(name: name)) {
            return "Invalid First Name"
        }
        return nil
    }
    
    static func lastNameErrorMessage(name: String) -> String? {
        if (!TextInputValidator.isNameValid(name: name)) {
            return "Invalid Last Name"
        }
        return nil
    }
}
