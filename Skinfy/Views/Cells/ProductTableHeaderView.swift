//
//  ProductTableHeaderView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/25/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class ProductTableHeaderView: UITableViewHeaderFooterView {
    
    enum State {
        case closed
        case opened
        case empty
    }

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    override var reuseIdentifier: String? {
        get {
            return String(describing: ProductTableHeaderView.self)
        }
    }
    
    var expandableSection: ExpandableSection? {
        didSet {
            
        }
    }
    
    private var state: State = .empty
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: ProductTableHeaderView.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        contentView.addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let section = expandableSection {
            if (section.category.items.isEmpty) {
                state = .empty
            } else {
                if (section.isExpanded) {
                    state = .opened
                } else {
                    state = .closed
                }
            }
            
            switch state {
            case .closed:
                btnAction.setImage(UIImage(named: "ic_plus_black"), for: .normal)
            case .opened:
                btnAction.setImage(UIImage(named: "ic_minus_black"), for: .normal)
            case .empty:
                btnAction.setImage(UIImage(named: "ic_plus_gray"), for: .normal)
            }
            
            let cat = section.category
            lblTitle.text = cat.title
            lblCount.text = "(\(cat.items.count))"
            switch cat.id {
            case 1:
                if (state == .empty) {
                    imgIcon.image = UIImage(named: "ic_face_gray")
                } else {
                    imgIcon.image = UIImage(named: "ic_face_red")
                }
            case 2:
                if (state == .empty) {
                    imgIcon.image = UIImage(named: "ic_body_gray")
                } else {
                    imgIcon.image = UIImage(named: "ic_body_red")
                }
            case 3:
                if (state == .empty) {
                    imgIcon.image = UIImage(named: "ic_hair_gray")
                } else {
                    imgIcon.image = UIImage(named: "ic_hair_red")
                }
            case 4:
                if (state == .empty) {
                    imgIcon.image = UIImage(named: "ic_oral_gray")
                } else {
                    imgIcon.image = UIImage(named: "ic_oral_red")
                }
            case 5:
                if (state == .empty) {
                    imgIcon.image = UIImage(named: "ic_other_gray")
                } else {
                    imgIcon.image = UIImage(named: "ic_other_red")
                }
            default:
                break
            }
            
        }
    }

}
