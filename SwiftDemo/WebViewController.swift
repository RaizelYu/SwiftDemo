//
//  WebViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {
    var webView:UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "webView Demo"
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        var url = NSURL(string: "http://www.baidu.com")
        var urlRequest = NSURLRequest(URL: url!)
        
        self.webView = UIWebView(frame: CGRectMake(0, 0, 350, 400))
        self.webView?.loadRequest(urlRequest)
        self.webView?.delegate = self
        self.view.addSubview(self.webView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        println("123")
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
