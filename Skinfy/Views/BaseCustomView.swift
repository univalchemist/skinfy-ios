//
//  BaseCustomView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class BaseCustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: BaseCustomView.self)
        bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)        
    }
    
    func initContentView(contentView: UIView) {
        addSubview(contentView)
        sendSubviewToBack(contentView)
        contentView.frame = self.bounds                
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
    }
}
