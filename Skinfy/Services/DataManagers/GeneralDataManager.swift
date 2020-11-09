//
//  GeneralDataManager.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/21/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class GeneralDataManager: BaseDataManager {
    
    func setFirstAppRun(value: Bool) {
        if value == false {
            set(value: nil, forKey: ConstantKeys.FirstAppRun)
        } else {
            set(value: value, forKey: ConstantKeys.FirstAppRun)
        }
    }
    
    func isAppAlreadyRun() -> Bool {
        return value(forKey: ConstantKeys.FirstAppRun) != nil
    }
}
