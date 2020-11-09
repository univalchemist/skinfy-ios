//
//  ListProductAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/31/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct ListProductAPIResult: Codable, ParametersInput {
    //for success
    let data: ListProductAPIData?
    //for error
    let message: String?
    let error: String?
}

struct ListProductAPIData: Codable {
    let products: [ProductDataModel]
}

struct ProductDataModel: Codable {
    //TODO:
}
