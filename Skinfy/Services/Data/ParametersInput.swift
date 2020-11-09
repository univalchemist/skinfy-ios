//
//  ParametersInput.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

protocol ParametersInput {
    func toJSON() -> [String: Any]
}

extension ParametersInput where Self: Codable {
    func toJSON() -> [String : Any] {
        return self.dictionary
    }
}
