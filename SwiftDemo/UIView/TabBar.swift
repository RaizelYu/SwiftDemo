//
//  TabBar.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/19.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

protocol tabSelDelegate:NSObjectProtocol{
    func tabSelCallBack(tag:NSInteger)
}

class TabBar: UIView {
    var arr:NSMutableArray?
    var delegate:tabSelDelegate?
        /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView(frame: CGRect, arrTemp:NSArray){
        self.frame = frame
        self.arr = NSMutableArray(array: arrTemp)
        var off_x = 0 as CGFloat
        var itemWid = 80 as CGFloat
        for var i=0; i<self.arr?.count; i++ {
            var itemView = TabBarItem()
            itemView.tag = 10086 + i
            var dic = arrTemp.objectAtIndex(i) as! NSDictionary
            itemView.initView(CGRectMake(off_x, 0, itemWid, 49), dic: dic)
            self.addSubview(itemView)
            off_x += itemWid
            
            var gesture = UITapGestureRecognizer(target: self, action: "tap:")
            itemView.addGestureRecognizer(gesture)
        }
    }
    
    func tap(sender:UITapGestureRecognizer){
        var tagIndex = sender.view!.tag - 10086
        var arrSub = self.subviews as NSArray
        for var i=0; i<arrSub.count; i++ {
            var itemView = self.viewWithTag(10086 + i) as! TabBarItem
            itemView.resetNorStatus(self.arr!.objectAtIndex(i) as! NSDictionary)
        }
        
        var itemView = self.viewWithTag(10086 + tagIndex) as! TabBarItem
        itemView.resetSelStatus(self.arr!.objectAtIndex(tagIndex) as! NSDictionary)
        
        if (self.delegate != nil) {
            self.delegate?.tabSelCallBack(tagIndex)
        }
    }
    
    func setSelFocus(tag:NSInteger){
        var itemView = self.viewWithTag(10086 + tag) as! TabBarItem
        itemView.resetSelStatus(self.arr!.objectAtIndex(tag) as! NSDictionary)
    }
    
}
