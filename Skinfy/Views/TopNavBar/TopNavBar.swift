//
//  TopNavBar.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TopNavBar: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBInspectable var title: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lblTitle.text = title
    }
    
}
