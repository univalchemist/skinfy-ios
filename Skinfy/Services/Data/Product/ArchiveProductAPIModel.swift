//
//  ArchiveProductAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ArchiveProductAPIParam: Codable, ParametersInput {
    let id: String
}

struct ArchiveProductAPIResult: Codable {
    //for error
    let error: String?
    let message: String?
    //for success
    //TODO
}
