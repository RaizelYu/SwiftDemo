//
//  LabelViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {
    var lbl:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "标签控件"
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
//        self.lbl = Apputil.alloc().initLabel(CGRectMake(100, 100, 100, 100), text:"label Demo")//Apputil.initLabel(<#Apputil#>)
        self.lbl = Apputil.alloc().initLabel(CGRectMake(100, 100, 100, 100), text: "label Demo", color: UIColor.redColor())
        self.lbl?.text = "发动机阿斯利康房间卡拉是房间爱多少级放大时看见范德萨L发动机撒范德萨反馈；打卡上浪费"
        self.lbl?.numberOfLines = 0
//        self.lbl?.lineBreakMode = ByTruncatingTail
        self.lbl?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        self.view.addSubview(self.lbl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
