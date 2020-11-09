//
//  EditProductAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct EditProductAPIParam: Codable, ParametersInput {
    let id: String
    let name: String?
    let image: String?
    let description: String?
    let icon: String?
    let brandName: String?
    let size: Int?
    let unit: String?
    let topLevel: String?
    let quantity: Int?
    let category: String?
    let subCategory: String?
    let pao: String?
    let ric: String?
    let dateOpen: String?
    let expired: String?
    let dateStartUse: String?
    let dateStartEnd: String?
    let isDailyUse: Bool?
    let group: String?
}

struct EditProductAPIResult: Codable {
    //for error
    //TODO:
}

