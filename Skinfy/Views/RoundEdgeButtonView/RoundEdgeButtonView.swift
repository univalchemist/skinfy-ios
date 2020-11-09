//
//  RoundEdgeButtonView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation
import UIKit

class RoundEdgeButtonView: MyView {
        
    @IBOutlet weak var imgLeftIcon: UIImageView!
    @IBOutlet weak var leftImageHeight: NSLayoutConstraint!
    @IBOutlet weak var leftImageWidth: NSLayoutConstraint!
    @IBOutlet weak var imgRightIcon: UIImageView!
    @IBOutlet weak var rightImageHeight: NSLayoutConstraint!
    @IBOutlet weak var rightImageWidth: NSLayoutConstraint!
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var centerLabelConstraint: NSLayoutConstraint!
    
    @IBInspectable var fontSize: CGFloat = 16 {
        willSet {
            lblText.font = lblText.font.withSize(newValue)
        }
    }
    
    @IBInspectable var fontName: String = Constants.Fonts.MuseoSans900 {
        willSet {
            lblText.font = UIFont(name: newValue, size: 16)
        }
    }
    
    @IBInspectable var leftImageName: String = "" {
        willSet {
            imgLeftIcon.image = UIImage(named: newValue)
        }
    }
    @IBInspectable var leftIconHeight: CGFloat = 20 {
        willSet {
            leftImageHeight.constant = newValue
        }
    }
    @IBInspectable var leftIconWidth: CGFloat = 20 {
        willSet {
            leftImageWidth.constant = newValue
        }
    }
    @IBInspectable var rightImageName: String = "" {
        willSet {
            imgRightIcon.image = UIImage(named: newValue)
        }
    }
    @IBInspectable var rightIconHeight: CGFloat = 20 {
        willSet {
            rightImageHeight.constant = newValue
        }
    }
    @IBInspectable var rightIconWidth: CGFloat = 20 {
        willSet {
            rightImageWidth.constant = newValue
        }
    }
    
    @IBInspectable var text: String = "" {
        willSet {
            lblText.text = newValue
        }
    }
        
    override func awakeFromNib() {
        if (leftImageName == "" && rightImageName != "") {
            imgLeftIcon.removeFromSuperview()
            centerLabelConstraint.constant = -10
        }
        if (rightImageName == "" && leftImageName != "") {
            imgRightIcon.removeFromSuperview()
            centerLabelConstraint.constant = 10
        }
    }
}
