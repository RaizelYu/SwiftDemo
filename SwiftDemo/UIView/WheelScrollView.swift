//
//  WheelScrollView.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/27.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class WheelScrollView: UIView, UIScrollViewDelegate {
    var wheelScrollView:UIScrollView?
    var pageControl:UIPageControl?
    var array:NSMutableArray?
    var timer:NSTimer?
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
    
    
    func initWithFrame(frame:CGRect,arr:NSArray){
        self.frame = frame
        
        array = NSMutableArray(array: arr)
//        self.timer = NSTimer.scheduledTimerWithTimeInterval(1000000, target: self, selector: "moveSideScrollView:", userInfo: nil, repeats: true)
        
        self.wheelScrollView = UIScrollView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height-20))
        self.wheelScrollView?.delegate = self
        self.wheelScrollView?.pagingEnabled = true
        self.wheelScrollView?.showsHorizontalScrollIndicator = false
        self.wheelScrollView?.showsVerticalScrollIndicator = false
        self.addSubview(self.wheelScrollView!)
        
        var size:CGFloat = CGFloat(self.array!.count)//self.array?.count
        var contentSize:CGFloat = frame.size.width * size
        self.wheelScrollView!.contentSize = CGSizeMake(contentSize, frame.size.height-20)
        
        for var i=0;i<self.array?.count;i++ {
            var imgView = Apputil.alloc().initImageView(CGRectMake(CGFloat(i)*frame.size.width, 0, frame.size.width, self.wheelScrollView!.frame.size.height), image: UIImage(named: String(i))!)
            self.wheelScrollView?.addSubview(imgView)
        }
    }
    
    func moveSideScrollView(timer:NSTimer){
//        self.wheelScrollView?.contentOffset = CGPointMake(self.wheelScrollView!.contentOffset.x + self.wheelScrollView!.frame.size.width, 0) 
        var off_x = self.wheelScrollView!.contentOffset.x + self.wheelScrollView!.frame.size.width
        if off_x >= self.wheelScrollView!.contentSize.width {
            off_x = 0
        }
        
        self.wheelScrollView?.scrollRectToVisible(CGRectMake(off_x,0,self.frame.size.width,self.wheelScrollView!.frame.size.height), animated: false)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        var off_x = self.wheelScrollView!.contentOffset.x
//        println(off_x)
//        if off_x >= (CGFloat(self.array!.count-1))*self.wheelScrollView!.frame.size.width {
//            println(off_x)
//            self.wheelScrollView?.scrollRectToVisible(CGRectMake(0,0,self.frame.size.width,self.wheelScrollView!.frame.size.height), animated: false)
//        }
//        if off_x < 0 {
//            println(off_x)
//            self.wheelScrollView?.scrollRectToVisible(CGRectMake(CGFloat(self.array!.count-1)*self.wheelScrollView!.frame.size.width,0,self.frame.size.width,self.wheelScrollView!.frame.size.height), animated: false)
//        }

//        var off_x = self.wheelScrollView!.contentOffset.x
//        if off_x > (self.wheelScrollView!.frame.size.width * (self.array!.count-1)-1) {
//            self.wheelScrollView?.contentOffset = CGPointMake(self.wheelScrollView!.frame.size.width, 0)
//        }
//        if off_x < 1 {
//            self.wheelScrollView?.contentOffset = CGPointMake((self.array!.count-2)*self.wheelScrollView!.frame.size.width, 0)
//        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.stopTimer();
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.refumeTimer();
    }
    
    func refumeTimer(){
        println("恢复定时器")
        //恢复定时器
        self.timer?.fireDate = NSDate.distantPast() as! NSDate
    }
    
    func stopTimer(){
        println("暂停定时器")
        //暂停定时器
        self.timer?.fireDate = NSDate.distantFuture() as! NSDate
    }
    
}
