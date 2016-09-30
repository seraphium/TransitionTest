//
//  TransitionAnimator.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/30.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit


class TransitionAnimator :NSObject, UIViewControllerAnimatedTransitioning {
    
    let animateDuration : CGFloat = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(animateDuration)
    }

    //MARK: - main animation logic
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) {
            let finalRect = transitionContext.finalFrame(for: toVC)
            toVC.view.frame = finalRect.offsetBy(dx: 0, dy: UIScreen.main.bounds.size.height)
            transitionContext.containerView.addSubview(toVC.view)
            //animation logic
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [.curveEaseIn], animations: {
                    toVC.view.frame = finalRect
                
                }, completion: { finished in
                    transitionContext.completeTransition(finished)
                 
            })
            
        }
        
        
    }
}
