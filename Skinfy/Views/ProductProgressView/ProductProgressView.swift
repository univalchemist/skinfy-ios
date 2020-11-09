//
//  ProductProgressView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class ProductProgressView: BaseCustomView {
    
    enum ProductProgressViewType {
        case counter
        case icon
        case start
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var circularProgressView: CircularProgressView!
    //for counter view type
    @IBOutlet weak var viewCounter: UIView!
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    //for icon view type
    @IBOutlet weak var viewIcon: UIView!
    @IBOutlet weak var lblIconSubtitle: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    var isFinished: Bool = false
    var isExpired: Bool = false
    
    //for start type
    @IBOutlet weak var viewStart: UIView!
        
    
    @IBInspectable
    var progressColor: String = Constants.Colors.PictonBlue
    @IBInspectable
    var progressShadowColor: String?
    
    var progressViewType: ProductProgressViewType = .counter
    
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
        
        if let sColor = progressShadowColor {
            circularProgressView.shadowColor = sColor
        }
        
        viewStart.isHidden = true
        viewIcon.isHidden = true
        viewCounter.isHidden = true
        switch progressViewType {
        case .counter:
            viewCounter.isHidden = false
            circularProgressView.shadowColor = progressShadowColor
            
            break
        case .icon:
            viewIcon.isHidden = false
            if (isFinished) {
                imgIcon.image = UIImage(named: "ic_circled_check_blue")
                lblIconSubtitle.font = UIFont(name: "Roboto-Regular", size: 10)
                lblIconSubtitle.textColor = UIColor(hexString: Constants.Colors.Shakespeare)
                lblIconSubtitle.text = NSLocalizedString("finished", comment: "")
                circularProgressView.percent = 1.0
            } else if (isExpired) {
                imgIcon.image = UIImage(named: "ic_warning")
                lblIconSubtitle.font = UIFont(name: "Roboto-Bold", size: 11)
                lblIconSubtitle.textColor = UIColor(hexString: Constants.Colors.Amaranth)
                lblIconSubtitle.text = NSLocalizedString("expired", comment: "")
                circularProgressView.percent = 1.0
                circularProgressView.shadowColor = Constants.Colors.TickleMePink
                circularProgressView.progressColor = Constants.Colors.Amaranth
            }
            break
        case .start:
            viewStart.isHidden = false
            circularProgressView.fillColor = Constants.Colors.Amaranth
            break
        }
        
        circularProgressView.setNeedsDisplay()
    }
    
}
