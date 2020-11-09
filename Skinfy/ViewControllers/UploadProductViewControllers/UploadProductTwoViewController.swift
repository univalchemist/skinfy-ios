//
//  UploadProductTwoViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/2/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class UploadProductTwoViewController: UIViewController {

    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var btnSave: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        btnSave.onTap = onBtnSave
    }
    
    @objc func onBtnBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func onBtnSave() {
        let vc = UploadProductThreeViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
}
