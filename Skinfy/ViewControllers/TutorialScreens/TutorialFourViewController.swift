//
//  TutorialFourViewController.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/21/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

class TutorialFourViewController: UIViewController {

    @IBOutlet weak var viewOverlay: UIView!
    @IBOutlet weak var bottomView: TutorialBottomView!
    @IBOutlet weak var imgTutorial: UIImageView!
    @IBOutlet weak var viewBtnLetsGo: RoundEdgeButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideViews()
        
        bottomView.pageControl.currentPage = 3
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        viewOverlay.addGestureRecognizer(swipeRight)
        viewBtnLetsGo.onTap = onBtnLetsGo
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showViews()
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            onBack()
        }
    }
    
    func onBtnLetsGo() {
        GeneralDataManager().setFirstAppRun(value: true)
        Helper.goToHomeScreen()
    }

}

extension TutorialFourViewController: TutorialScreenProtocol {
    func hideViews() {
        viewOverlay.alpha = 0
        bottomView.alpha = 0
        imgTutorial.alpha = 0
    }
    
    func showViews() {
        UIView.animate(withDuration: 1.5) {
            self.viewOverlay.alpha = 0.9
            self.bottomView.alpha = 1
            self.imgTutorial.alpha = 1
        }
    }
    
    func onNext() {
        
    }
    
    func onBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
