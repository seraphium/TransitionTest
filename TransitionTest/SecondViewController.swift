//
//  SecondViewController.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/29.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit
import SVProgressHUD

class SecondViewController : UIViewController, UIViewControllerTransitioningDelegate {
    
    var panTransition : UIPercentDrivenInteractiveTransition?
    let transitionAnimator = TransitionAnimator()
    let dismissAnimator = TransitionDismissAnimator()
    

    override func awakeFromNib() {
        self.transitioningDelegate = self
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        self.view.backgroundColor = UIColor.white
    }
    override func viewDidLoad()  {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(gesture:)))
        
        self.view.addGestureRecognizer(panGesture)
    
        loadNews()
    }
    
    func panGestureAction(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        switch (gesture.state) {
        case .began:
            panTransition = UIPercentDrivenInteractiveTransition()
            self.dismiss(animated: true, completion: nil)
        case .changed :
            let percent = translation.y / 600 <= 1 ? (translation.y / 600) : 1
            panTransition?.update(percent)
        case .cancelled:
            panTransition?.cancel()
            panTransition = nil
        case .ended:
            panTransition?.finish()
            panTransition = nil
        default:
            panTransition?.finish()
        }
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        return self.panTransition
    }

    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = PresentationController(presentedViewController: presented, presenting: presenting)
        return presentationController
    }
    
    @IBAction func dismissClicked(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - main logic
    func loadNews() {
        SVProgressHUD.show(withStatus: "正在加载...")

        NetworkManager.sharedManager.loadTopNews(type: .shishang) {
            items in
            SVProgressHUD.dismiss()

            if let newsItems = items {
                print(newsItems.count)
                
            }
            
        }
    
    }
}
