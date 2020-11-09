//
//  CreateGroupView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/29/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class CreateGroupView: BaseCustomView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var txtGroupName: UITextField!
    @IBOutlet weak var btnCreate: RoundEdgeButtonView!
    
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
        txtGroupName.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("group_name", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        btnCreate.onTap = onTapCreate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        modalView.layer.cornerRadius = 20
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = modalView.bounds
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        modalView.addSubview(blurEffectView)
        modalView.sendSubviewToBack(blurEffectView)
    }
        
    @IBAction func onBtnClose(_ sender: Any) {
        removeFromSuperview()
    }
    
    private func onTapCreate() {
        //TODO:
    }
    
}
