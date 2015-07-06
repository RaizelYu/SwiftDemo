//
//  ImageViewViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class ImageViewViewController: UIViewController {
    var imgView:UIImageView?
//    var img    :UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "imgView Demo"
        
//        var img = UIImage(named: "123.jpg")
//        self.imgView = UIImageView(frame:CGRectMake(0, 0, img!.size.width, img!.size.height))
//        self.imgView!.image = img
        
//        self.img = UIImage(named: "123.jpg")
//        self.imgView = Apputil.alloc().initImageView(CGRectMake(0, 0, img!.size.width, img!.size.height), image:img)
        
        var img = UIImage(named: "123.jpg")
        self.imgView = Apputil.alloc().initImageView(CGRectMake(0, 0, img!.size.width, img!.size.height), image:img!)
        self.view.addSubview(self.imgView!)
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
