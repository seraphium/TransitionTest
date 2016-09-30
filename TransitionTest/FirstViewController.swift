//
//  FirstViewController.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/29.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit

class FirstViewController : UIViewController, PresentedViewControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! SecondViewController
        destVC.delegate = self
        
    }
    
    func dismiss(viewController: UIViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}
