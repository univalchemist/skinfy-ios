//
//  FBSignInResultModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct FBSignInResultModel: Codable {
    let email: String
    let id: String
    let lastName: String
    let firstName: String
    var accessToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case email
        case id
        case lastName = "last_name"
        case firstName = "first_name"
        case accessToken
    }
}
