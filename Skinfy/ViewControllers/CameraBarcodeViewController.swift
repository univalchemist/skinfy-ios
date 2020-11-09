//
//  CameraBarcodeViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/5/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit
import BarcodeScanner

class CameraBarcodeViewController: BarcodeScannerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //custom top bar
        let topMargin = Helper.getSafeAreaInsets().top
        let topView = TopNavBar(frame: CGRect(x: 0, y: topMargin, width: self.view.bounds.width, height: 53))
        topView.title = "Upload Product"
        topView.btnBack.addTarget(self, action: #selector(self.onBtnBackBarcode), for: .touchUpInside)
        cameraViewController.view.addSubview(topView)
        cameraViewController.view.bringSubviewToFront(cameraViewController.flashButton)
                
        //custom footer
        let bounds = messageViewController.view.bounds
        let view = BarcodeScannerFooter(frame: bounds)
        view.btnEnterManually.addTarget(self, action: #selector(self.onBtnEnterManually), for: .touchUpInside)
        messageViewController.view.addSubview(view)
    }
    
    @objc func onBtnBackBarcode() {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onBtnEnterManually() {
        //open Upload Product screen
        let vc = UploadProductOneViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }

}
