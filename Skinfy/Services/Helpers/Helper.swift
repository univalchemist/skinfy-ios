//
//  Helper.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/23/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class Helper {
    static func goToHomeScreen() {
        UIApplication.shared.windows.first?.rootViewController = HomeTabController.sharedInstance
    }
    
    static func goToLoginScreen() {
        let vc = LoginViewController.initFromNib()
        let nav = UINavigationController(rootViewController: vc)
        nav.setNavigationBarHidden(true, animated: false)
        UIApplication.shared.windows.first?.rootViewController = nav
    }
    
    static func getOptionPopupView(positionPoint: CGPoint) -> OptionPopupView {
        let width: CGFloat = 176
        let height: CGFloat = 148
        let view = OptionPopupView(frame: CGRect(x: positionPoint.x - width + 33 , y: positionPoint.y + 68, width: width, height: height))
        return view
    }
    
    /**
     Used to know which View Controller is currently shown
     */
    static func getShownViewController() -> UIViewController? {
        let vc = UIApplication.shared.keyWindow?.rootViewController
        if ((vc?.isKind(of: HomeTabController.self)) != nil) {
            let homeTab = vc as! HomeTabController
            let navCon = homeTab.viewControllers?[homeTab.selectedIndex] as! UINavigationController
            let shownVC = navCon.viewControllers.last
            return shownVC
        }
        return nil
    }
    
    static func getSafeAreaInsets() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    static func showAlert(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        vc.present(alert, animated: true, completion: nil)        
    }
    
    static func parseErrorMessage(error: Error) -> ErrorMessage {
        if let error = error as? ErrorMessage {
            return error
        }
        if let error = error as? BaseErrorModel {
            return error.asError() as! ErrorMessage
        }
        if let error = error as? BaseAPIError {
            switch error {
            case .serverError(let msg):
                return ErrorMessage(title: "", message: msg)
            case .unknown:
                return ErrorMessage.UnknownError
            }
        }
        return ErrorMessage.UnknownError
    }
}
