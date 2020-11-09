//
//  TutorialBottomView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TutorialBottomView: BaseCustomView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSkip: UIButton!
    
    @IBInspectable var currentPage: Int = 0 {
        willSet {
            pageControl.currentPage = newValue
        }
    }
    
    var onSkip: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView(contentView: contentView)
        onCustomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initContentView(contentView: contentView)
    }
    
    @IBAction func onBtnSkip(_ sender: Any) {
        if (onSkip != nil) {
            onSkip!()
        }
    }
    
    
    private func onCustomInit() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let scale:CGFloat = 1.2
        pageControl.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        for dot in pageControl.subviews {
            dot.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
        pageControl.subviews[currentPage].shadow(color: UIColor(hexString: Constants.Colors.BrilliantRose).cgColor, offset: CGSize(width: 0, height: 0), radius: 10, opacity: 0.75)
        
        if (onSkip == nil) {
            btnSkip.removeFromSuperview()
        }
    }
}
