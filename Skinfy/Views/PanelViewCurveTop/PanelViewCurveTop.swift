//
//  PanelViewCurveTop.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class PanelViewCurveTop: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func commonInit() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        let y:CGFloat = 25
        let curveTo:CGFloat = -25

        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        UIColor.white.setFill()
        myBezier.fill()
    }
}
