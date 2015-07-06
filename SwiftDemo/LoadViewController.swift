//
//  LoadViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/26.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {
//    var clScrollView:WheelScrollView?
    var clScrollView:CLScrollView?
    var arrSource   :NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "轮播图Demo"
        self.view.backgroundColor = UIColor.whiteColor()
    
        self.arrSource = ["http://d.hiphotos.baidu.com/image/w%3D310/sign=9833ea1b4d4a20a4311e3ac6a0529847/11385343fbf2b21148363747c88065380cd78e9b.jpg","http://d.hiphotos.baidu.com/image/w%3D310/sign=1a3a71bc5b82b2b7a79f3fc501accb0a/3b292df5e0fe9925074f80e836a85edf8cb171c3.jpg","http://c.hiphotos.baidu.com/image/w%3D310/sign=58aecf6b372ac65c67056072cbf2b21d/8435e5dde71190ef14ef81d4cc1b9d16fdfa60a0.jpg","http://img3.imgtn.bdimg.com/it/u=1326227067,2638125726&fm=21&gp=0.jpg"]
//        self.arrSource = ["http://d.hiphotos.baidu.com/image/w%3D310/sign=9833ea1b4d4a20a4311e3ac6a0529847/11385343fbf2b21148363747c88065380cd78e9b.jpg","http://d.hiphotos.baidu.com/image/w%3D310/sign=1a3a71bc5b82b2b7a79f3fc501accb0a/3b292df5e0fe9925074f80e836a85edf8cb171c3.jpg"]
        self.clScrollView = CLScrollView()
        self.clScrollView?.initView(CGRectMake(0, 64, KScreenWidth, 200), arr: self.arrSource!)
        self.view.addSubview(self.clScrollView!)
        
        
//        self.arrSource = ["http://d.hiphotos.baidu.com/image/w%3D310/sign=9833ea1b4d4a20a4311e3ac6a0529847/11385343fbf2b21148363747c88065380cd78e9b.jpg","http://d.hiphotos.baidu.com/image/w%3D310/sign=1a3a71bc5b82b2b7a79f3fc501accb0a/3b292df5e0fe9925074f80e836a85edf8cb171c3.jpg","http://c.hiphotos.baidu.com/image/w%3D310/sign=58aecf6b372ac65c67056072cbf2b21d/8435e5dde71190ef14ef81d4cc1b9d16fdfa60a0.jpg","http://img3.imgtn.bdimg.com/it/u=1326227067,2638125726&fm=21&gp=0.jpg"]
//        self.clScrollView = WheelScrollView(frame: CGRectZero)
//        self.clScrollView?.initWithFrame(CGRectMake(0, 100, KScreenWidth, 200), arr: self.arrSource!)
//        self.view.addSubview(self.clScrollView!)
        // Do any additional setup after loading the view.
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
