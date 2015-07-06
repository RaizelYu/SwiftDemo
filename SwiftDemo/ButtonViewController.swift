//
//  ButtonViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    var button:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Button Demo"
        self.view.backgroundColor = UIColor.whiteColor()
        
//        self.button = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
//        self.button.frame = CGRectMake(100, 100, 100, 100)
//        self.button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        self.button.setTitle("button", forState: UIControlState.Normal)
//        self.button.addTarget(self, action:"tap:", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(self.button!)
        self.button = Apputil.alloc().initButton(CGRectMake(100, 100, 100, 100), text: "button", tapAction: "tap:", target:self, bgColor:UIColor.clearColor(), textColor:UIColor.blackColor())
//        self.button.addTarget(self, action: "tap:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.button)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tap(sender:UIButton){
        if sender.isEqual(self.button){
            var alaVc = AlamofireViewController()
            self.navigationController?.pushViewController(alaVc, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
