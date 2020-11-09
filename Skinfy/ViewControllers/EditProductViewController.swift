//
//  EditProductViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/29/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class EditProductViewController: UIViewController {

    
    @IBOutlet weak var topBar: TopNavBar!
    @IBOutlet weak var paoRicCollectionView: PAORICCollectionView!
    
    //data for the PAO Symbol Number
    let paoSymbols: [PAORICIcon] = [
        PAORICIcon(imageName: "ic_pao_6m_white", label: "6 mos."),
        PAORICIcon(imageName: "ic_pao_9m_white", label: "9 mos."),
        PAORICIcon(imageName: "ic_pao_12m_white", label: "12 mos."),
        PAORICIcon(imageName: "ic_pao_24m_white", label: "24 mos."),
        PAORICIcon(imageName: "ic_pao_30m_white", label: "30 mos."),
        PAORICIcon(imageName: "ic_pao_other_white", label: "Other"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        
        paoRicCollectionView.data = paoSymbols
        
    }
    
    @objc func onBtnBack() {
        navigationController?.popViewController(animated: true)
    }

}
