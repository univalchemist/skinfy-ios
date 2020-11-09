//
//  TutorialOneViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/17/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TutorialOneViewController: UIViewController {

    @IBOutlet weak var imgTutorialHighlight: UIImageView!
    @IBOutlet weak var viewWelcomeTo: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var bottomView: TutorialBottomView!
    @IBOutlet weak var viewOverlay: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        
        bottomView.onSkip = onSkip
        bottomView.pageControl.currentPage = 0
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        viewOverlay.addGestureRecognizer(swipeLeft)        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showViews()
    }
    
    func onSkip() {
        GeneralDataManager().setFirstAppRun(value: true)
        Helper.goToHomeScreen()
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            onNext()
        }
    }
}

extension TutorialOneViewController: TutorialScreenProtocol {
    
    func hideViews() {
        imgTutorialHighlight.alpha = 0
        viewWelcomeTo.alpha = 0
        lblDescription.alpha = 0
        bottomView.alpha = 0
        viewOverlay.alpha = 0
    }
    
    func showViews() {
        UIView.animate(withDuration: 1.5) {
            self.imgTutorialHighlight.alpha = 1
            self.viewWelcomeTo.alpha = 1
            self.lblDescription.alpha = 1
            self.bottomView.alpha = 1
            self.viewOverlay.alpha = 0.9
        }
    }
    
    func onNext() {
        let vc = TutorialTwoViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onBack() {
        //None
    }
}
