//
//  PAORICIconButton.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/30/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class PAORICIconButton: BaseCustomView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainView: MyView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblLabel: UILabel!
    @IBInspectable var imageName: String = ""
    @IBInspectable var labelText: String = ""
    
    private var isSelected: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
    }
    
    func setSelected(selected: Bool) {
        isSelected = selected
        setNeedsLayout()
        mainView.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (imageName != "") {
            imgIcon.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
            if (!isSelected) {
                imgIcon.tintColor = UIColor(hexString: Constants.Colors.Empress)
            } else {
                imgIcon.tintColor = .white
            }
        }
        if (isSelected) {
            mainView.color = Constants.Colors.Amaranth
            mainView.shadowColor = Constants.Colors.BrilliantRose
            mainView.shadowOpacity = 0.75
            mainView.borderColor = Constants.Colors.Amaranth
            lblLabel.textColor = .white
        } else {
            mainView.shadowColor = Constants.Colors.White
            mainView.shadowOpacity = 0
            mainView.color = Constants.Colors.White
            mainView.borderColor = Constants.Colors.Lola
            lblLabel.textColor = UIColor(hexString: Constants.Colors.Empress)
        }
        
        lblLabel.text = labelText
    }
}
