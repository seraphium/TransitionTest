//
//  SecondViewController.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 16/9/29.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
    
    var delegate : PresentedViewControllerDelegate?
    
    @IBAction func dismissClicked(_ sender: UIButton)
    {
        delegate?.dismiss(viewController: self)
        
    }
}
