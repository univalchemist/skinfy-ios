//
//  ProgressBar.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/2/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressBar: UIView {
    
    @IBInspectable var progress: CGFloat = 0.1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()!
        
        let widthOffset: CGFloat = 20
        let progressHeight: CGFloat = 8
        let size = CGRect(x: widthOffset / 2, y: self.bounds.height / 2 - progressHeight / 2, width: self.bounds.width - widthOffset, height: progressHeight)
        
        UIColor(hexString: Constants.Colors.Geyser).setFill()
        let path = UIBezierPath(roundedRect: size, cornerRadius: size.height / 2)
        path.fill()
        
        context.saveGState()
        let shadowColor = UIColor(hexString: Constants.Colors.BrilliantRose)
        context.setShadow(offset: CGSize(width: 0, height: 0), blur: 10, color: shadowColor.cgColor)
        
        //progress
        UIColor(hexString: Constants.Colors.Amaranth).setFill()
        UIBezierPath(roundedRect: CGRect(x: size.origin.x, y: size.origin.y, width: size.width * progress, height: progressHeight), cornerRadius: progressHeight / 2).fill()
        
        context.restoreGState()
    }
    
    
}
