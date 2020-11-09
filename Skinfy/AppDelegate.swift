//
//  AppDelegate.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        //to check font names
        //TODO: remove this when done
        /*for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }*/
        
        if let _ = UserDataManager().userData(), let _ = UserDataManager().userToken() {
            Helper.goToHomeScreen()
        } else {
            Helper.goToLoginScreen()
        }
        
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
    }
}

