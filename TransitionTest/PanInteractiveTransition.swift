//
//  PanInteractiveTransition.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/30.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit

class PanInteractiveTransition : UIPercentDrivenInteractiveTransition {

    var presentedVC : UIViewController!
    
    func panToDismiss(viewController: UIViewController) {
        self.presentedVC = viewController
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(gesture:)))
        
        self.presentedVC.view.addGestureRecognizer(panGesture)
        
    }
    
    func panGestureAction(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: presentedVC.view)
        switch (gesture.state) {
        case .changed :
            let percent = translation.y / 150 > 1 ? 1 : translation.y
            self.update(percent)
            print(percent)
        case .cancelled:
            self.cancel()
        case .ended:
            self.finish()
        default:
            self.finish()
        }
    }
}
