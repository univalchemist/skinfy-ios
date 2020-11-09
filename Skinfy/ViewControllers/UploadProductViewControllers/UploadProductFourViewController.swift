//
//  UploadProductFourViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/3/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class UploadProductFourViewController: UIViewController {
    
    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var btnNext: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        btnNext.onTap = onBtnNext
    }
    
    func onBtnNext() {
        let vc = UploadProductFiveViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onBtnBack() {
        navigationController?.popViewController(animated: true)
    }

}
