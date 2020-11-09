//
//  GroupAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/31/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct GroupListAPIResult: Codable {
    //for success
    let data: GroupListAPIData?
    //for error
    let message: String?
    let error: String?
}

struct GroupListAPIData: Codable {
    //TODO
}
