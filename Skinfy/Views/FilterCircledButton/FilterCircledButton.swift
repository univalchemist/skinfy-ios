//
//  FilterCircledButtons.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class FilterCircledButton: BaseCustomView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var circularProgressView: CircularProgressView!
    
    private var isTapped: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
        commonInit()
    }
    
    private func commonInit() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnTap)))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    @objc private func onBtnTap() {
        if (!isTapped) {
            isTapped = true
            circularProgressView.centerColor = Constants.Colors.Amaranth
            circularProgressView.setNeedsDisplay()
            lblTitle.isHidden = true
            lblSubtitle.isHidden = true
            imgIcon.isHidden = false
        } else {
            isTapped = false
            circularProgressView.centerColor = "#FFFFFF"
            circularProgressView.setNeedsDisplay()
            lblTitle.isHidden = false
            lblSubtitle.isHidden = false
            imgIcon.isHidden = true
        }
    }
    
    
}
