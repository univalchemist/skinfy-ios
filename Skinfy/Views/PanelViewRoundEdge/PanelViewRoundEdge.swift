//
//  PanelViewRoundEdge.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/24/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

@IBDesignable
class PanelViewRoundEdge: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
}
