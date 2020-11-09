//
//  GroupBoxCollectionCell.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/24/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class GroupBoxCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mainView.layer.cornerRadius = 5
        
        if (isSelected) {
            mainView.backgroundColor = UIColor(hexString: Constants.Colors.Amaranth)
            mainView.shadow(color: UIColor(hexString: Constants.Colors.LightOrchid).cgColor, offset: CGSize(width: 0, height: 0), radius: 3, opacity: 0.75)
            mainView.layer.borderWidth = 0
            valueLbl.textColor = .white
            subtitleLbl.textColor = .white
        } else {
            mainView.backgroundColor = .white
            mainView.shadow(color: UIColor(hexString: Constants.Colors.Empress).cgColor, offset: CGSize(width: 0, height: 1), radius: 3, opacity: 0.15)
            mainView.layer.borderWidth = 1
            mainView.layer.borderColor = UIColor(hexString: Constants.Colors.Lola).cgColor
            valueLbl.textColor = UIColor(hexString: Constants.Colors.Empress)
            subtitleLbl.textColor = UIColor(hexString: Constants.Colors.Empress)
        }
    }

}
