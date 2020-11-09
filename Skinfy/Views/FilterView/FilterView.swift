//
//  FilterView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class FilterView: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btnClose: CircledCloseButton!
    @IBOutlet weak var btn30Days: FilterCircledButton!
    @IBOutlet weak var btn1To3Months: FilterCircledButton!
    @IBOutlet weak var btn3MonthsPlus: FilterCircledButton!
    
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
        btnClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnClose)))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btn30Days.circularProgressView.percent = 0.8
        btn30Days.circularProgressView.progressColor = Constants.Colors.BrilliantRose
        btn30Days.circularProgressView.shadowColor = Constants.Colors.BrilliantRose
        btn30Days.lblTitle.text = "30"
        btn30Days.lblSubtitle.text = "Days"
        
        btn1To3Months.circularProgressView.percent = 0.5
        btn1To3Months.circularProgressView.progressColor = Constants.Colors.MoodyBlue
        btn1To3Months.circularProgressView.shadowColor = Constants.Colors.Portage
        btn1To3Months.lblTitle.text = "1-3"
        btn1To3Months.lblSubtitle.text = "Months"
        
        btn3MonthsPlus.circularProgressView.progressColor = Constants.Colors.PictonBlue
        btn3MonthsPlus.circularProgressView.shadowColor = Constants.Colors.Portage
        btn3MonthsPlus.circularProgressView.percent = 0.1
        btn3MonthsPlus.lblTitle.text = "3+"
        btn3MonthsPlus.lblSubtitle.text = "Months"
    }
    
    @objc func onBtnClose() {
        self.removeFromSuperview()
    }
    
    
}
