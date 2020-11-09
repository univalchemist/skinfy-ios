//
//  TextInputValidator.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class TextInputValidator {
        
    static func isEmailValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    static func isNameValid(name: String) -> Bool {
        let nameStr = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let nameRegex = "^[a-zA-Z0-9 ]{3,64}"
        let test = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return test.evaluate(with: nameStr)
    }
    
    static func isPasswordValid(password: String) -> Bool {
        let passStr = password.trimmingCharacters(in: .whitespacesAndNewlines)
        return passStr.count >= 6
    }
}
