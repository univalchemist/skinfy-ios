//
//  WelcomeToViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class WelcomeToViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let vc = FirstNameViewController.initFromNib()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
