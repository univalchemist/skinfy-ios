//
//  ProductTableViewCell.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/25/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var lblHeaderText: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblExpiration: UILabel!
    @IBOutlet weak var progressView: ProductProgressView!    
    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var imgArchive: UIImageView!
    
    var data: Product? {
        didSet {
            if let dat = data {
                //TODO: set to actual values when data from back-end is ready
                //default values
                imgCheck.isHidden = false
                imgArchive.isHidden = true
                progressView.progressViewType = .counter
                progressView.isFinished = false
                progressView.isExpired = false
                progressView.circularProgressView.percent = 0.1
                progressView.circularProgressView.progressColor = Constants.Colors.Shakespeare
                progressView.circularProgressView.centerColor = Constants.Colors.White
                mainView.backgroundColor = .white
                
                if (dat.isFinished) {
                    progressView.progressViewType = .icon
                    progressView.isFinished = true
                } else if (dat.isExpired) {
                    progressView.progressViewType = .icon
                    progressView.isExpired = true
                    progressView.circularProgressView.centerColor = Constants.Colors.LavenderBlush
                    mainView.backgroundColor = UIColor(hexString: Constants.Colors.LavenderBlush)
                }
                
                if (dat.isArchived) {
                    imgCheck.isHidden = true
                    imgArchive.isHidden = false
                    
                    let vc = Helper.getShownViewController() as? HomeViewController
                    if vc != nil {
                        imgArchive.image = UIImage(named: "ic_archive_gray")
                    } else {
                        imgArchive.image = UIImage(named: "ic_archive_red")
                    }
                }
                
                progressView.setNeedsLayout()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        DispatchQueue.main.async {
            if let dat = self.data {
                if (dat.isExpired) {
                    self.mainView.shadow(color: UIColor(hexString: Constants.Colors.Amaranth).cgColor, offset: CGSize(width: 0, height: 3), radius: 5, opacity: 0.25)
                } else {
                    self.handleDefaultShadow()
                }
            } else {
                self.handleDefaultShadow()
            }
        }
    }
    
    private func handleDefaultShadow() {
        if (self.isSelected) {
            self.mainView.shadow(color: UIColor(hexString: Constants.Colors.BrilliantRose).cgColor, offset: CGSize(width: 0, height: 0), radius: 7.5, opacity: 0.75)
        } else {
            self.mainView.shadow(color: UIColor(hexString: Constants.Colors.Empress).cgColor, offset: CGSize(width: 0, height: 3), radius: 5, opacity: 0.15)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.layer.cornerRadius = 5
    }
    
}
