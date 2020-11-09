//
//  ForgotPasswordAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 11/2/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ForgotPasswordAPIParam: Codable, ParametersInput {
    let email: String
}

struct ForgotPasswordAPIResult: Codable {
    //for error
    let error: String?
    let message: String?
    //for success
    let data: ForgotPasswordAPIData?
}

struct ForgotPasswordAPIData: Codable {
    let message: String
}
