//
//  ChangePasswordAPIParam.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/26/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ChangePasswordAPIParam: Codable, ParametersInput {
    let oldPassword: String
    let password: String
}
