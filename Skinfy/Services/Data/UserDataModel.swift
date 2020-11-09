//
//  UserDataModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/5/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct UserDataModel: Codable {
    let _id: String
    let email: String
    var firstName: String?
    var lastName: String?
    let avatar: String?
    let signedVia: String?
    let status: String?
    let typeAccount: String?
}
