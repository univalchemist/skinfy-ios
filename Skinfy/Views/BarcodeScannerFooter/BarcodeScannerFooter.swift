//
//  BarcodeScannerFooter.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/5/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class BarcodeScannerFooter: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnEnterManually: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
    }
}
