//
//  CircularProgressView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/25/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {
    
    var percent: CGFloat = 0.1
    var shadowColor: String?
    //var shadowOpacity: CGFloat?
    var progressColor: String = Constants.Colors.PictonBlue
    //if this is set, circle is color filled
    var fillColor: String?
    var centerColor: String = "#FFFFFF"
    
    private var shadowSpace: CGFloat = 10
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()!
        
        //Base circle
        if let fColor = fillColor {
            UIColor(hexString: fColor).setFill()
        } else {
            UIColor(hexString: Constants.Colors.Lola).setFill()
        }
        
        let outerPath = UIBezierPath(ovalIn: CGRect(x: shadowSpace / 2, y: shadowSpace / 2, width: rect.width - shadowSpace, height: rect.height - shadowSpace))
        outerPath.fill()
        //self.frame isn’t defined yet, so we can’t use self.center
        let viewCenter = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        if (fillColor == nil) {
            //Semi Circles
            let radius = rect.width * 0.5 - (shadowSpace / 2)
            let startAngle: CGFloat = 270
            let endAngle = ((startAngle) + (360 * percent))
            UIColor(hexString: progressColor).setFill()
            let midPath = UIBezierPath()
            midPath.move(to: viewCenter)
            midPath.addArc(withCenter: viewCenter, radius: CGFloat(radius), startAngle: startAngle.degreesToRadians, endAngle: endAngle.degreesToRadians, clockwise: true)


            //shadow
            context.saveGState()
            if let sColor = shadowColor {
                context.setShadow(offset: CGSize(width: 0, height: 0), blur: 6, color: UIColor(hexString: sColor).cgColor)
            }
            midPath.close()
            midPath.fill()
            context.restoreGState()


            //Center circle
            UIColor(hexString: centerColor).setFill()
            let centerPath = UIBezierPath(ovalIn:rect.insetBy(dx: rect.width * 0.175 / 2 + (shadowSpace / 2), dy: rect.height * 0.175 / 2 + (shadowSpace / 2)))
            centerPath.fill()
        }
    }
}
