//
//  CheckboxRound.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/3/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class CheckboxRound: UIView {
    
    var selected: Bool = false
    
    lazy var baseCircle: UIView = {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .clear
        view.layer.cornerRadius = self.bounds.height / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hexString: Constants.Colors.PinkSwan).cgColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        return view
    }()
    
    lazy var dotCircle: UIView = {
        let width = self.bounds.width * 0.6
        let height = self.bounds.height * 0.6
        let view = UIView(frame: CGRect(x: self.bounds.width / 2 - width / 2, y: self.bounds.height / 2 - height / 2, width: width, height: height))
        view.layer.cornerRadius = height / 2
        view.backgroundColor = UIColor(hexString: Constants.Colors.CocoaBrown)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        DispatchQueue.main.async {
            self.addSubview(self.baseCircle)
            self.baseCircle.addSubview(self.dotCircle)
            self.handleColor()
        }
    }
    
    @objc private func onTap() {
        selected = !selected
        handleColor()
    }
    
    private func handleColor() {
        if (selected) {
            baseCircle.layer.borderColor = UIColor(hexString: Constants.Colors.CocoaBrown).cgColor
            dotCircle.isHidden = false
        } else {
            baseCircle.layer.borderColor = UIColor(hexString: Constants.Colors.PinkSwan).cgColor
            dotCircle.isHidden = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
