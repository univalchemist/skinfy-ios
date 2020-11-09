//
//  CircledButtonIcon.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class CircledButtonIcon: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBInspectable var imageName: String = ""
    
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
        circleView.layer.cornerRadius = circleView.frame.height / 2
        
        lblTitle.text = title
        imgIcon.image = UIImage(named: imageName)
    }
}
