//
//  EditProfileAPIResult.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/26/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct EditProfileAPIResult: Codable {
    //if error
    let message: String?
    let error: String?
    //if success
    let data: EditProfileAPIData?
}

struct EditProfileAPIData: Codable {
    let success: Bool
}
