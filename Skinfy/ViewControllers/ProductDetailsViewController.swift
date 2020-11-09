//
//  ProductDetailsViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/29/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var btnOptions: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBtnBack(_ sender: Any) {
        HomeTabController.sharedInstance.showTabBar(show: true)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnOptions(_ sender: Any) {
        let optionPopupView = Helper.getOptionPopupView(positionPoint: btnOptions.center)
        optionPopupView.delegate = self
        self.view.addSubview(optionPopupView)
    }
}

extension ProductDetailsViewController: OptionPopupDelegate {
    func onEdit() {
        let vc = EditProductViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onDelete() {
        //TODO:
    }
    
    
}
