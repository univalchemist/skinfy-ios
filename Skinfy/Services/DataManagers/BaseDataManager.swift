//
//  BaseDataManager.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/14/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class BaseDataManager {
                
    func setObject<T: Codable>(value: T, forKey: String) {
        UserDefaults.standard.set(value.dictionary, forKey: forKey)
    }
    
    func object<T: Codable>(forKey: String) -> T? {
        if let dict = UserDefaults.standard.value(forKey: forKey) {
            do {
                return try T.init(from: dict)
            } catch {
                return nil
            }
        }
        return nil
    }
    
    func set(value: Any?, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    func value(forKey: String) -> Any? {
        return UserDefaults.standard.value(forKey: forKey)
    }
}
