//
//  SignInResultModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/5/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct SignInResultModel: Codable {
    let data: SignInResultData
}

struct SignInResultData: Codable {
    let token: String
    let user: UserDataModel
}
