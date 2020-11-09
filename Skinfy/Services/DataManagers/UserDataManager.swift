//
//  UserDataManager.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/21/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class UserDataManager: BaseDataManager {
    
    func setToken(token: String) {
        set(value: token, forKey: ConstantKeys.UserToken)
    }
    
    func userToken() -> String? {
        return value(forKey: ConstantKeys.UserToken) as? String
    }
    
    func setUserData(user: UserDataModel) {
        setObject(value: user, forKey: ConstantKeys.UserData)
    }
    
    /**
     returns the current user data signed-in
     */
    func userData() -> UserDataModel? {
        return object(forKey: ConstantKeys.UserData)
    }
    
    /**
     nil the saved user data object
     */
    func clearUserData() {
        set(value: nil, forKey: ConstantKeys.UserData)
    }
}
