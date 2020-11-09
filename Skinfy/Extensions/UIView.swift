//
//  UIView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/16/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func shadow(color:CGColor, offset:CGSize, radius:CGFloat, opacity:Float, cornerRadius:CGFloat = 0.0, shadowWidthMultiplier: CGFloat = 1.0) {
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        var width = bounds.width
        if (cornerRadius > 0) {
            width = bounds.width * shadowWidthMultiplier
        }
        let b = CGRect(x: 0, y: 0, width: width, height: bounds.height)
        let path = UIBezierPath(roundedRect: b, cornerRadius: cornerRadius)
        layer.shadowPath = path.cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
