//
//  CreateGroupBoxCollectionCell.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/24/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class CreateGroupBoxCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .clear
        mainView.backgroundColor = .clear
        mainView.layer.cornerRadius = 5
        let border = CAShapeLayer()
        border.strokeColor = UIColor(hexString: Constants.Colors.Amaranth).cgColor
        border.lineDashPattern = [5, 5]
        border.frame = mainView.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: mainView.bounds, cornerRadius: 5).cgPath
        border.lineWidth = 1
        mainView.layer.addSublayer(border)
    }

}
