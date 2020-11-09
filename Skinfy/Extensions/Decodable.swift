//
//  Decodable.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/14/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

extension Decodable {
    init(from: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
