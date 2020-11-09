//
//  CheckExistEmailResultModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct CheckExistEmailResultModel: Codable {
    let data: ExistEmailData
}

struct ExistEmailData: Codable {
    let isExist: Bool
}
