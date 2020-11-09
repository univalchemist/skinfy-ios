//
//  UploadProductThreeViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/2/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class UploadProductThreeViewController: UIViewController {

    @IBOutlet weak var topBar: TopNavBar!
    
    @IBOutlet weak var paoSymbolCollectionView: PAORICCollectionView!
    @IBOutlet weak var ricCollectionView: PAORICCollectionView!
    
    @IBOutlet weak var btnNext: RoundEdgeButtonView!
    
    //data for the PAO Symbol Number
    let paoSymbols: [PAORICIcon] = [
        PAORICIcon(imageName: "ic_pao_6m_white", label: "6 mos."),
        PAORICIcon(imageName: "ic_pao_9m_white", label: "9 mos."),
        PAORICIcon(imageName: "ic_pao_other_white", label: "Other"),
        PAORICIcon(imageName: "ic_pao_12m_white", label: "12 mos."),
        PAORICIcon(imageName: "ic_pao_24m_white", label: "24 mos."),
        PAORICIcon(imageName: "ic_pao_30m_white", label: "30 mos."),        
    ]
    
    //data for RIC
    let ricData: [PAORICIcon] = [
        PAORICIcon(imageName: "ic_ric1_white", label: "PETE"),
        PAORICIcon(imageName: "ic_ric2_white", label: "HDPE"),
        PAORICIcon(imageName: "ic_ric3_white", label: "V"),
        PAORICIcon(imageName: "ic_ric4_white", label: "LDPE"),
        PAORICIcon(imageName: "ic_ric5_white", label: "PP"),
        PAORICIcon(imageName: "ic_ric6_white", label: "PS"),
        PAORICIcon(imageName: "ic_ric7_white", label: "Other"),
        PAORICIcon(imageName: "ic_ric_none_white", label: "None"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.btnBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        
        let myLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let ratio: CGFloat = width / 414
        myLayout.itemSize = CGSize(width: 110 * ratio, height: 78 * ratio)
        myLayout.minimumInteritemSpacing = 0
        myLayout.minimumLineSpacing = 2
        paoSymbolCollectionView.data = paoSymbols
        paoSymbolCollectionView.setCollectionViewLayout(layout: myLayout, animated: true)
        ricCollectionView.data = ricData
        ricCollectionView.setCollectionViewLayout(layout: myLayout, animated: true)
        
        btnNext.onTap = onBtnNext
    }
    
    @objc func onBtnBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func onBtnNext() {
        let vc = UploadProductFourViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }

}
