//
//  Encodable.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/6/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

struct JSON {
    static let encoder = JSONEncoder()
}
extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        let tmp = (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
        return tmp
    }
}
