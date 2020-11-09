//
//  SignUpResultModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct SignUpResultModel: Codable {
    let data: SignUpResultData
}

struct SignUpResultData: Codable {
    let token: String
    let user: UserDataModel
}
