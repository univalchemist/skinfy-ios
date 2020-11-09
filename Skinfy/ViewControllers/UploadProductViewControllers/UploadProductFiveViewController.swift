//
//  UploadProductFiveViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/5/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class UploadProductFiveViewController: UIViewController {

    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var btnFinish: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        btnFinish.onTap = onBtnFinish
    }
    
    func onBtnFinish() {
        let view = UploadDoneView(frame: self.view.bounds)
        view.btnGoToHome.addTarget(self, action: #selector(onBtnGoHome), for: .touchUpInside)
        self.view.addSubview(view)
    }
    
    @objc func onBtnBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onBtnGoHome() {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popToRootViewController(animated: true)
    }

}
