//
//  DeleteProductAPIModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct DeleteProductAPIParam: Codable, ParametersInput {
    let id: String
}

struct DeleteProductAPIResult: Codable {        
    //for error
    var error: String?
    var message: String?
        
    //TODO: for success
}
