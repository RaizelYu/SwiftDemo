//
//  TabBarItem.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/19.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class TabBarItem: UIView {
    var label  :UILabel?
    var imgView:UIImageView?
    var dic    :NSDictionary?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func initView(frame: CGRect,dic:NSDictionary){
        self.frame = frame
        self.label = Apputil().initLabel(CGRectZero, text: dic.objectForKey("text") as! String, color: UIColor.blackColor())
        self.label?.font = UIFont.systemFontOfSize(14)
        self.addSubview(self.label!)
        self.label?.frame = CGRectMake(0, 0, frame.size.width, self.label!.font.lineHeight)
        
        self.imgView = Apputil().initImageView(CGRectZero, image: UIImage(named: dic.objectForKey("imgNor") as! String)!)
        self.imgView?.frame = CGRectMake(0, 20, 40, 20)
        self.addSubview(self.imgView!)
        
//        self.imgView?.frame = CGRectMake(0, 0, frame.size.width, self.label!.font.lineHeight)
//        self.label?.tag = 10086
//        var lbl = self.viewWithTag(10086) as! UILabel
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetNorStatus(dic:NSDictionary){
        self.imgView?.image = UIImage(named: dic.objectForKey("imgNor") as! String)
    }
    
    func resetSelStatus(dic:NSDictionary){
        self.imgView?.image = UIImage(named: dic.objectForKey("imgSel") as! String)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
