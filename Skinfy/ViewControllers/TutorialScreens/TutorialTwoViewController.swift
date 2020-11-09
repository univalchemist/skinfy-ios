//
//  TutorialTwoViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/19/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TutorialTwoViewController: UIViewController {
    
    @IBOutlet weak var viewOverlay: UIView!
    @IBOutlet weak var imgTutorialDetails: UIImageView!
    @IBOutlet weak var bottomView: TutorialBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        bottomView.onSkip = onSkip
        bottomView.pageControl.currentPage = 1
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        viewOverlay.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        viewOverlay.addGestureRecognizer(swipeRight)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showViews()
    }
    
    private func onSkip() {
        GeneralDataManager().setFirstAppRun(value: true)
        Helper.goToHomeScreen()
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            onNext()
        } else if gesture.direction == .right {
            onBack()
        }
    }
}

extension TutorialTwoViewController: TutorialScreenProtocol {
    func hideViews() {
        viewOverlay.alpha = 0
        imgTutorialDetails.alpha = 0
        bottomView.alpha = 0
    }
    
    func showViews() {
        UIView.animate(withDuration: 1.5) {
            self.viewOverlay.alpha = 0.9
            self.imgTutorialDetails.alpha = 1
            self.bottomView.alpha = 1
        }
    }
    
    func onNext() {
        let vc = TutorialThreeViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
