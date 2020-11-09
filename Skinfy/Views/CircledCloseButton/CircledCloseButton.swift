//
//  CircledCloseButton.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class CircledCloseButton: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var circleView: UIView!
    
    @IBInspectable var borderRadius: CGFloat = 0
    
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
        
        circleView.layer.cornerRadius = borderRadius
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.backgroundColor = UIColor(hexString: Constants.Colors.Astronaut).withAlphaComponent(0.85)
    }
    
    
}
