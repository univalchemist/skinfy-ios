//
//  ChangePasswordAPIResult.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/26/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ChangePasswordAPIResult: Codable {
    //if error
    let message: String?
    let error: String?
    //if success
    let data: ChangePasswordAPIData?
}

struct ChangePasswordAPIData: Codable {
    let success: Bool
}
