//
//  SwitchCustom.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/1/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class SwitchCustom: UIView {
    /**
     A Boolean value that determines whether the switch is ON/OFF
     */
    var isOn: Bool = false
    
    private lazy var offLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.RobotoRegular, size: 10)
        label.textColor = UIColor(hexString: Constants.Colors.PinkSwan)
        label.text = "OFF"
        
        return label
    }()
    
    private lazy var onLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.RobotoRegular, size: 10)
        label.textColor = UIColor(hexString: Constants.Colors.White)
        label.text = "ON"
        return label
    }()
    
    let circleWidthHeight: CGFloat = 19
    
    private lazy var circleView: UIView = {
        let view = UIView(frame: CGRect(x: 1, y: self.frame.height / 2 - circleWidthHeight / 2, width: circleWidthHeight, height: circleWidthHeight))
        view.backgroundColor = .white
        view.layer.cornerRadius = circleWidthHeight / 2
        return view
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        view.backgroundColor = UIColor(hexString: Constants.Colors.Amaranth)
        view.layer.cornerRadius = self.frame.height / 2
        //view.transform = CGAffineTransform(scaleX: 0, y: 0)
        return view
    }()
    
    let switchAnimationSpeed: TimeInterval = 0.2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        
    }
    
    private func initOffLabel() {
        addSubview(offLabel)
        offLabel.translatesAutoresizingMaskIntoConstraints = false
        let offLabelTrailing = NSLayoutConstraint(item: self.offLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -6)
        let offLabelCenterY = NSLayoutConstraint(item: self.offLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(offLabelTrailing)
        self.addConstraint(offLabelCenterY)
    }
    
    private func initOnLabel() {
        addSubview(onLabel)
        onLabel.translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: onLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 6)
        let centerY = NSLayoutConstraint(item: onLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(leading)
        self.addConstraint(centerY)
    }
    
    private func initCircleView() {
        addSubview(circleView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(overlayView)
        initOffLabel()
        initOnLabel()
        initCircleView()
        animateSwitch()
        
        layer.cornerRadius = frame.height / 2
        backgroundColor = UIColor(hexString: Constants.Colors.Lola)
    }
    
    @objc private func onTap() {
        if (isOn) {
            //turn off
            UIView.animate(withDuration: switchAnimationSpeed, animations: {
                self.circleView.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (finished) in
                if (finished) {
                    self.isOn = false
                    self.offBG()
                }
            }
            offOverlay()
        } else {
            //turn on
            UIView.animate(withDuration: switchAnimationSpeed, animations: {
                self.circleView.transform = CGAffineTransform(translationX: self.frame.width - 2 - self.circleWidthHeight, y: 0)
            }) { (finished) in
                if (finished) {
                    self.isOn = true
                    self.onBG()
                }
            }
            onOverlay()
        }
    }
    
    private func animateSwitch() {
        var transform: CGAffineTransform = CGAffineTransform(translationX: 0, y: 0)
        if (isOn) {
            //show as ON
            transform = CGAffineTransform(translationX: self.frame.width - 2 - self.circleWidthHeight, y: 0)
            onOverlay()
        } else {
            offOverlay()
        }
        UIView.animate(withDuration: switchAnimationSpeed, animations: {
            self.circleView.transform = transform
        }) { (finished) in
            if (finished) {
                if (self.isOn) {
                    self.onBG()
                } else {
                    self.offBG()
                }
            }
        }
    }
    
    private func offBG() {
        offLabel.isHidden = false
        onLabel.isHidden = true
    }
    
    private func onBG() {
        offLabel.isHidden = true
        onLabel.isHidden = false
    }
    
    private func offOverlay() {
        UIView.animate(withDuration: switchAnimationSpeed) {
            self.overlayView.frame = CGRect(x: 0, y: 0, width: 0, height: self.frame.height)
        }
    }
    
    private func onOverlay() {
        UIView.animate(withDuration: switchAnimationSpeed) {
            self.overlayView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        }
    }
    
}
