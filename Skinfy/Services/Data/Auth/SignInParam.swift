//
//  SignInParam.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/6/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct SignInParam: Codable, ParametersInput {
    let email: String
    let password: String
}
