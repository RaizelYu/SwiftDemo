//
//  NormalViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/19.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class NormalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网络请求Demo"
        self.view.backgroundColor = UIColor.whiteColor()

        var strId = "appidiosappkeyj7v8NQjhvLmegElogin_name18620612773login_passwd501805911"
        var strMd = (strId as NSString).MD5Digest()
        //1f2d7e4c3cbc5a965d19fe36b710ef7c
        var dictionary:NSMutableDictionary = NSMutableDictionary(capacity: 0)
        dictionary.setObject("ios", forKey: "appid")
        dictionary.setObject("member", forKey: "action")
        dictionary.setObject("LoginMember", forKey: "method")
        dictionary.setObject("18620612773", forKey: "login_name")
        dictionary.setObject("501805911", forKey: "login_passwd")
        dictionary.setObject("1f2d7e4c3cbc5a965d19fe36b710ef7c", forKey: "sign")
        RequestManager.shareInstance().doTaskRequest(dictionary, success: { (dic) -> Void in
            println(dic)
        }) { (dic) -> Void in
            println(dic)
//            var err:NSError = nil
            var obj = ResponObj(dictionary: dic.objectForKey("data") as! [NSObject : AnyObject], error: nil) as ResponObj
            
            println(obj.advance)
        }
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
