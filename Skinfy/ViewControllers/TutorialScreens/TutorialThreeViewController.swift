//
//  TutorialThreeViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/21/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TutorialThreeViewController: UIViewController {
    
    @IBOutlet weak var viewOverlay: UIView!
    @IBOutlet weak var imgTutorial: UIImageView!
    @IBOutlet weak var bottomView: TutorialBottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        bottomView.pageControl.currentPage = 2
        bottomView.onSkip = onSkip
        
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
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            onNext()
        } else if gesture.direction == .right {
            onBack()
        }
    }
    
    func onSkip() {
        GeneralDataManager().setFirstAppRun(value: true)
        Helper.goToHomeScreen()
    }

}

extension TutorialThreeViewController: TutorialScreenProtocol {
    func hideViews() {
        viewOverlay.alpha = 0
        imgTutorial.alpha = 0
        bottomView.alpha = 0
    }
    
    func showViews() {
        UIView.animate(withDuration: 1.5) {
            self.viewOverlay.alpha = 0.9
            self.imgTutorial.alpha = 1.0
            self.bottomView.alpha = 1.0
        }
    }
    
    func onNext() {
        let vc = TutorialFourViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
