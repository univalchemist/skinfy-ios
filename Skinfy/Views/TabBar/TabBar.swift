//
//  TabBar.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/23/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class TabBar: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var circularButtonView: MyView!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    private var shapeLayer: CALayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: TabBar.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        self.backgroundColor = .clear
        addSubview(contentView)
        sendSubviewToBack(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        btnHome.addTarget(self, action: #selector(onBtnHome), for: .touchUpInside)
        btnProfile.addTarget(self, action: #selector(onBtnProfile), for: .touchUpInside)
    }
    
    private func createPath() -> CGPath {
        let context = UIGraphicsGetCurrentContext()!

        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let shadowColor = UIColor(red: 0.494, green: 0.431, blue: 0.451, alpha: 1.000)

        let shadow = NSShadow()
        shadow.shadowColor = shadowColor.withAlphaComponent(0.15 * shadowColor.cgColor.alpha)
        shadow.shadowOffset = CGSize(width: 0, height: -5)
        shadow.shadowBlurRadius = 15
                
        let multiplier: CGFloat = 1.0
        let width = self.frame.width
        let barPath = UIBezierPath()
        barPath.move(to: CGPoint(x: width*0.6411*multiplier, y: 39.46))
        barPath.addLine(to: CGPoint(x: width*0.6403*multiplier, y: 39.46))
        barPath.addCurve(to: CGPoint(x: width*0.5636*multiplier, y: 25.32), controlPoint1: CGPoint(x: width*0.6111*multiplier, y: 39.24), controlPoint2: CGPoint(x: width*0.5835*multiplier, y: 34.14))
        barPath.addLine(to: CGPoint(x: width*0.5650*multiplier, y: 25.93))
        barPath.addCurve(to: CGPoint(x: width*0.4372*multiplier, y: 25.01), controlPoint1: CGPoint(x: width*0.5304*multiplier, y: 11.06), controlPoint2: CGPoint(x: width*0.4731*multiplier, y: 10.64))
        barPath.addCurve(to: CGPoint(x: width*0.4360*multiplier, y: 25.46), controlPoint1: CGPoint(x: width*0.4368*multiplier, y: 25.16), controlPoint2: CGPoint(x: width*0.4364*multiplier, y: 25.31))
        barPath.addLine(to: CGPoint(x: width*0.4351*multiplier, y: 25.89))
        barPath.addCurve(to: CGPoint(x: width*0.3578*multiplier, y: 39.46), controlPoint1: CGPoint(x: width*0.4148*multiplier, y: 34.56), controlPoint2: CGPoint(x: width*0.3870*multiplier, y: 39.46))
        barPath.addLine(to: CGPoint(x: 0, y: 39.46))
        barPath.addLine(to: CGPoint(x: 0, y: 89.5))
        barPath.addLine(to: CGPoint(x: width*multiplier, y: 89.5))
        barPath.addLine(to: CGPoint(x: width*multiplier, y: 39.46))
        barPath.addLine(to: CGPoint(x: width*0.6411*multiplier, y: 39.46))
        barPath.close()
        context.saveGState()
        context.setShadow(offset: shadow.shadowOffset, blur: shadow.shadowBlurRadius, color: (shadow.shadowColor as! UIColor).cgColor)
        fillColor.setFill()
        barPath.fill()
        context.restoreGState()

        return barPath.cgPath
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = UIColor.white.cgColor

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func onBtnHome() {
        btnHome.setImage(UIImage(named: "ic_home_selected"), for: .normal)
        btnProfile.setImage(UIImage(named: "ic_profile"), for: .normal)
        HomeTabController.sharedInstance.selectedIndex = 0
    }
    
    @objc func onBtnProfile() {
        btnProfile.setImage(UIImage(named: "ic_profile_selected"), for: .normal)
        btnHome.setImage(UIImage(named: "ic_home"), for: .normal)
        HomeTabController.sharedInstance.selectedIndex = 1
    }
}
