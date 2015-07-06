//
//  UITextFieldViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class UITextFieldViewController: UIViewController,UITextFieldDelegate {
    var textField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TextField Demo"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField = UITextField(frame: CGRectMake(10, 100, 300, 40))
        self.textField?.backgroundColor = UIColor.redColor()
        self.textField?.delegate = self
        self.textField?.placeholder = "TextField test"
        self.view.addSubview(self.textField!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return self.textField!.resignFirstResponder()
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
