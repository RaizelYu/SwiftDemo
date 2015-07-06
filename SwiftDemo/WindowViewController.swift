//
//  WindowViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/19.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class WindowViewController: UIViewController,tabSelDelegate,UINavigationControllerDelegate {
    var tabBar : TabBar?
    var arr    : NSMutableArray?
    var firView:RootViewController?
    var secView:SecondViewController?
    var thiView:ThirdViewController?
    var forView:ForViewController?
    var navi   :UINavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initView(){
        self.arr = NSMutableArray(capacity: 0)
        var arrTemp = ["首页","搜索","购物车","会员"] as NSArray
        var arrNor = ["icon_dynamic","icon_found","icon_more","icon_personal"] as NSArray
        var arrSel = ["icon_dynamic_h","icon_found_h","icon_more_h","icon_personal_h"] as NSArray
        for var i=0; i<arrTemp.count; i++ {
            var dicTemp = ["text":arrTemp.objectAtIndex(i),"imgNor":arrNor.objectAtIndex(i),"imgSel":arrSel.objectAtIndex(i)]
            self.arr?.addObject(dicTemp)
        }
        
        self.tabBar = TabBar()
        self.tabBar?.delegate = self
        self.tabBar?.initView(CGRectMake(0, KScreenHeight - K_VC_Y, 320, K_Tab_Height), arrTemp: self.arr!)
//        self.view.addSubview(self.tabBar!)
        
        self.firView = RootViewController()
        self.secView = SecondViewController()
        self.thiView = ThirdViewController()
        self.forView = ForViewController()
    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabSelCallBack(tag:NSInteger){
        var arr:NSMutableArray? = NSMutableArray()
        if tag == 0{
            arr?.addObject(self.firView!)
        }else if tag == 1{
            arr?.addObject(self.secView!)
        }else if tag == 2{
            arr?.addObject(self.thiView!)
        }else{
            arr?.addObject(self.forView!)
        }
        self.navi?.setViewControllers(arr! as [AnyObject], animated: false)
    }

    func setNav(nav:UINavigationController){
        
        self.navi = nav
        self.navi?.delegate = self
    }

    func setPresetntMainView(){
        UIApplication.sharedApplication().keyWindow?.rootViewController = self.navi
        UIApplication.sharedApplication().keyWindow?.addSubview(self.tabBar!)
       
        self.tabSelCallBack(0)

        var subView = self.tabBar!.subviews as NSArray
        var itemView = subView.objectAtIndex(0) as! TabBarItem
        itemView.resetSelStatus(self.arr!.objectAtIndex(0) as! NSDictionary)
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if viewController == self.firView || viewController == self.secView || viewController == self.thiView || viewController == self.forView{
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.tabBar?.frame = CGRectMake(0, KScreenHeight - K_VC_Y, 320, K_Tab_Height)
            })
        }else{
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.tabBar?.frame = CGRectMake(0, KScreenHeight, 320, K_Tab_Height)
            })

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
