//
//  FirstViewController.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/29.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit

class FirstViewController : UIViewController,
PresentedViewControllerDelegate, UIViewControllerTransitioningDelegate {

    let transitionAnimator = TransitionAnimator()
    let dismissAnimator = TransitionDismissAnimator()
    let panTransition = PanInteractiveTransition()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SecondViewController
        destVC.delegate = self
        destVC.transitioningDelegate = self
        self.panTransition.panToDismiss(viewController: destVC)

    }
    
    func dismiss(viewController: UIViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.panTransition
    }
    
}
