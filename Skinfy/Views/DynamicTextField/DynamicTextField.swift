//
//  DynamicTextField.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/29/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class DynamicTextField: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var txtText: UITextField!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var textLeading: NSLayoutConstraint!
    
    @IBInspectable var label: String = "" {
        willSet {
            lblLabel.text = newValue
        }
    }
    @IBInspectable var placeholder: String = "" {
        willSet {
            txtText.attributedPlaceholder = NSAttributedString(string: newValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: Constants.Colors.PinkSwan)])
        }
    }
    @IBInspectable var rightIconName: String = "" {
        willSet {
            btnRight.setImage(UIImage(named: newValue), for: .normal)
        }
    }
    @IBInspectable var leftIconName: String = ""
    
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
        if (leftIconName == "") {
            textLeading.constant = 0
        } else {
            imgLeft.image = UIImage(named: leftIconName)
        }
        
        lblLabel.text = label
        
    }
    
    
}
