//
//  ProfileAPIResultModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/25/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ProfileAPIResultModel: Codable, ParametersInput {
    let data: ProfileAPIDataModel
}

struct ProfileAPIDataModel: Codable {
    let _id: String
    let status: String
    let typeAccount: String
    let firstName: String
    let email: String
    let password: String
    let lastName: String
    let avatar: String
    let signedVia: String
    let identifier: String
    let createdAt: String
    let updatedAt: String
    let token: String
}
