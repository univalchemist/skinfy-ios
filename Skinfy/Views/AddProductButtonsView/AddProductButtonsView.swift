//
//  AddProductButtonsView.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/28/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit
import BarcodeScanner

@IBDesignable
class AddProductButtonsView: BaseCustomView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var closeButtonBottom: NSLayoutConstraint!
    @IBOutlet weak var btnFaceY: NSLayoutConstraint!
    
    
    @IBOutlet weak var btnClose: CircledCloseButton!
    @IBOutlet weak var btnFace: CircledButtonIcon!
    @IBOutlet weak var btnBody: CircledButtonIcon!
    @IBOutlet weak var btnHair: CircledButtonIcon!
    @IBOutlet weak var btnOral: CircledButtonIcon!
    @IBOutlet weak var btnOther: CircledButtonIcon!
    
    let alphaAnimationSpeed: TimeInterval = 0.2
    let buttonsAnimationSpeed: TimeInterval = 0.5
    
    
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
        self.alpha = 0
        btnClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnClose)))
        btnFace.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnFace)))
        //TODO: for other buttons
        //temporary to onBtnFace for now
        btnBody.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnFace)))
        btnHair.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnFace)))
        btnOral.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnFace)))
        btnOther.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBtnFace)))
    }
    
    @objc func onBtnClose() {
        onClose(completion: nil)
    }
    
    private func onClose(completion: (() -> Void)?) {
        UIView.animate(withDuration: alphaAnimationSpeed) {
            self.alpha = 0
        }
        UIView.animate(withDuration: buttonsAnimationSpeed, animations: {
            self.initialPosition()
        }) { (finished) in
            if (finished) {
                self.removeFromSuperview()
                if let com = completion {
                    com()
                }
            }
        }
    }
    
    @objc func onBtnFace() {
        onClose {
            HomeTabController.sharedInstance.showTabBar(show: false)
            
            let vc = CameraBarcodeViewController()
            Helper.getShownViewController()?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    private func getPoint(view: UIView) -> CGPoint {
        return CGPoint(x: view.frame.origin.x, y: view.frame.origin.y)
    }
    
    private func getTransform(point: CGPoint, isPositive: Bool = false) -> CGAffineTransform {
        let closePoint = getPoint(view: btnClose)
        if (isPositive) {
            return CGAffineTransform(translationX: closePoint.x - (closePoint.x - point.x) - point.x, y: -(closePoint.y - (closePoint.y - point.y) - point.y))
        }
        return CGAffineTransform(translationX: -(closePoint.x - (closePoint.x - point.x) - point.x), y: -(closePoint.y - (closePoint.y - point.y) - point.y))
    }
    
    private func setAllAlpha(alpha: CGFloat) {
        btnFace.alpha = alpha
        btnBody.alpha = alpha
        btnHair.alpha = alpha
        btnOral.alpha = alpha
        btnOther.alpha = alpha
    }
    
    private func initialPosition() {
        let closePoint = getPoint(view: btnClose)
        let facePoint = getPoint(view: btnFace)
        let bodyPoint = getPoint(view: btnBody)
        let hairPoint = getPoint(view: btnHair)
        let oralPoint = getPoint(view: btnOral)
        let otherPoint = getPoint(view: btnOther)
        
        btnFace.transform = CGAffineTransform(translationX: closePoint.x - facePoint.x, y: 0)
        btnBody.transform = CGAffineTransform(translationX: closePoint.x - bodyPoint.x, y: closePoint.y - bodyPoint.y)
        btnHair.transform = CGAffineTransform(translationX: 0, y: closePoint.y - hairPoint.y)
        btnOral.transform = CGAffineTransform(translationX: -(oralPoint.x - closePoint.x), y: closePoint.y - oralPoint.y)
        btnOther.transform = CGAffineTransform(translationX: -(otherPoint.x - closePoint.x), y: 0)
        
        setAllAlpha(alpha: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //TODO: animation
        
        let closePoint = getPoint(view: btnClose)
        let facePoint = getPoint(view: btnFace)
        let bodyPoint = getPoint(view: btnBody)
        let hairPoint = getPoint(view: btnHair)
        let oralPoint = getPoint(view: btnOral)
        let otherPoint = getPoint(view: btnOther)
        
        initialPosition()
        
        UIView.animate(withDuration: alphaAnimationSpeed) {
            self.alpha = 1.0
        }
        
        UIView.animate(withDuration: buttonsAnimationSpeed) {
            self.btnFace.transform = CGAffineTransform(translationX: -(closePoint.x - (closePoint.x - facePoint.x) - facePoint.x), y: 0)
            
            self.btnBody.transform = self.getTransform(point: bodyPoint)
            
            self.btnHair.transform = self.getTransform(point: hairPoint)
            
            self.btnOral.transform = self.getTransform(point: oralPoint, isPositive: true)
            
            self.btnOther.transform = self.getTransform(point: otherPoint, isPositive: true)
            
            self.setAllAlpha(alpha: 1.0)
            
        }
        
        var bottomMargin: CGFloat = 0
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                bottomMargin = window.safeAreaInsets.bottom
            }
        }
        
        closeButtonBottom.constant += bottomMargin
        if (bottomMargin == 0) {
            btnFaceY.constant -= 32
        }
    }
}
