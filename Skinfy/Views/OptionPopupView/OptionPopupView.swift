//
//  OptionPopupView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/29/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

protocol OptionPopupDelegate {
    func onEdit()
    func onDelete()
}

class OptionPopupView: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var imgPencil: UIImageView!
    @IBOutlet weak var imgTrash: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    var delegate: OptionPopupDelegate?
    
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
        DispatchQueue.main.async {
            self.btnEdit.addTarget(self, action: #selector(self.onBtnEdit), for: .touchUpInside)
            self.btnDelete.addTarget(self, action: #selector(self.onBtnDelete), for: .touchUpInside)
        }
    }
    
    @objc private func onBtnEdit() {
        if let del = delegate {
            del.onEdit()
        }
    }
    
    @objc private func onBtnDelete() {
        if let del = delegate {
            del.onDelete()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        popupView.layer.cornerRadius = 5
        popupView.layer.shadowColor = UIColor(hexString: Constants.Colors.BrilliantRose).cgColor
        popupView.layer.shadowOffset = CGSize(width: 0, height: 6)
        popupView.layer.shadowRadius = 15
        popupView.layer.shadowOpacity = 0.5
    }
}
