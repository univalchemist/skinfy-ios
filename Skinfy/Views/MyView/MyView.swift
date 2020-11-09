//
//  MyView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class MyView: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        willSet {
            contentView.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        willSet {
            contentView.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: String = "" {
        willSet {
            contentView.layer.borderColor = UIColor(hexString: newValue).cgColor
        }
    }
    
    @IBInspectable var shadowColor: String = ""
    @IBInspectable var shadowX: CGFloat = 0.0
    @IBInspectable var shadowY: CGFloat = 0.0
    @IBInspectable var shadowRadius: CGFloat = 0.0
    @IBInspectable var shadowOpacity: Float = 0.0
    
    @IBInspectable var color: String = "" {
        willSet {
            contentView.backgroundColor = UIColor(hexString: newValue)
        }
    }
    
    private var isTouchDown: Bool = false
    var onTap: (() -> Void)?
    
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
        if (shadowColor != "") {
            contentView.shadow(color: UIColor(hexString: shadowColor).cgColor, offset: CGSize(width: shadowX, height: shadowY), radius: shadowRadius, opacity: shadowOpacity)
        }
    }
    
    override func awakeFromNib() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.onTap != nil {
            isTouchDown = true
            contentView.alpha = 0.8
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedDown()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchedDown()
    }
    
    func touchedDown() {
        if let tap = self.onTap {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if (self.isTouchDown) {
                    self.contentView.alpha = 1
                    self.isTouchDown = false
                    tap()
                }
            }
        }
        
    }
    
    
}
