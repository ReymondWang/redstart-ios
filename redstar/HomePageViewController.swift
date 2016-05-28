//
//  ViewController.swift
//  redstar
//
//  Created by 王亚南 on 16/5/26.
//  Copyright © 2016年 lelern. All rights reserved.
//

import UIKit
import MMDrawerController

class HomePageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        let appDelegte = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegte.centerContainer.openDrawerGestureModeMask = .PanningCenterView
        appDelegte.centerContainer.closeDrawerGestureModeMask = .PanningCenterView
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let appDelegte = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegte.centerContainer.openDrawerGestureModeMask = .None
        appDelegte.centerContainer.closeDrawerGestureModeMask = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuClick(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }

}

