//
//  HomeTabController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/23/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class HomeTabController: UITabBarController {
    static let sharedInstance = HomeTabController()
    
    var customTabBar: TabBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = generateNavController(vc: HomeViewController.initFromNib())
        let profileVC = generateNavController(vc: ProfileViewController.initFromNib())
        viewControllers = [homeVC, profileVC]
        
        tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //we can only have value of safeAreaInsets here in viewDidAppear
        let bottomMargin: CGFloat = Helper.getSafeAreaInsets().bottom
        
        let width = (414/self.view.bounds.width) * self.view.bounds.width
        customTabBar = TabBar(frame: CGRect(x: 0 - ((414-self.view.bounds.width)/2), y: self.view.bounds.height - bottomMargin - 90, width: width, height: 90))
        
        self.view.addSubview(customTabBar!)
    }
    
    func showTabBar(show: Bool) {
        customTabBar?.isHidden = !show
    }
    
    fileprivate func generateNavController(vc: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        return navController
    }
}
