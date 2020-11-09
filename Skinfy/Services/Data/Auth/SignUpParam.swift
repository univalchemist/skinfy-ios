//
//  SignUpParam.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct SignUpParam: Codable, ParametersInput {
    let username: String
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let avatar: String?
}
