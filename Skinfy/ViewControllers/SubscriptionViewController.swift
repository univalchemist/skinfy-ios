//
//  SubscriptionViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController {

    @IBOutlet weak var btnFirstPlan: MyView!
    @IBOutlet weak var btnSecondPlan: MyView!
    @IBOutlet weak var lblFreePlan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFirstPlan.onTap = onBtnFirstPlan
        btnSecondPlan.onTap = onBtnSecondPlan
        lblFreePlan.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnContinueFreePlan)))
    }
    
    func onBtnFirstPlan() {
        
    }
    
    func onBtnSecondPlan() {
        
    }
    
    @objc func onBtnContinueFreePlan() {
        let vc = TutorialOneViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }

}
