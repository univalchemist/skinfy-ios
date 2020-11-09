//
//  EditProfileAPIParam.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/26/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct EditProfileAPIParam: Codable, ParametersInput {
    let firstName: String?
    let lastName: String?
    let email: String?
}
