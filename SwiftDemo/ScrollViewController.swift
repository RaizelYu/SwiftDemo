//
//  ScrollViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate,UIAlertViewDelegate {
    var scrollView:UIScrollView?
    var pageControl:UIPageControl?
    var timer:NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "scrllView Demo"
        
        var item = [UIColor.redColor(),UIColor.yellowColor(),UIColor.blackColor()] as NSArray
        
        self.scrollView = UIScrollView(frame: CGRectMake(10, 100, 300, 300))
        var itemWid:CGFloat = self.scrollView!.frame.size.width
        self.scrollView?.delegate = self
//        self.scrollView?.backgroundColor = UIColor.redColor()
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.pagingEnabled = true
        self.scrollView?.delegate = self
        self.scrollView?.contentSize = CGSizeMake(3*itemWid, 0)
        self.view.addSubview(self.scrollView!)
        
        self.pageControl = UIPageControl(frame: CGRectMake((KScreenWidth-200)/2, 80, 200, self.scrollView!.frame.size.height-80))
        self.pageControl?.numberOfPages = 3
        self.pageControl?.currentPage = 0
        self.pageControl?.currentPageIndicatorTintColor = UIColor.redColor()
        self.pageControl?.pageIndicatorTintColor = UIColor.blackColor()
        self.view.addSubview(self.pageControl!)
        
        var fx:CGFloat = 0.0
        for var i=0;i<item.count;i++ {
            var frame = CGRectMake(fx, 0, 300, 300)
            var imgView = UIImageView(frame:frame)
            println(item.objectAtIndex(i))
            imgView.backgroundColor = item.objectAtIndex(i) as? UIColor
            imgView.userInteractionEnabled = true
            self.scrollView?.addSubview(imgView)
            
            var gesture = UITapGestureRecognizer(target: self, action: "tap:")
            imgView.addGestureRecognizer(gesture)
            
            fx += itemWid
        }
        // Do any additional setup after loading the view.
        self.addTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tap(gesture:UITapGestureRecognizer){
//        println("图片点击事件")
//        var alert = UIAlertView(title: "温馨提示", message: "确定点击", delegate: self, cancelButtonTitle: "确定")
        var alert = UIAlertView(title: "温馨提示", message: "确定点击", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex==0{
            println("0事件")
        }else{
            println("1事件")
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollviewW:CGFloat = scrollView.frame.size.width;
        let x:CGFloat = scrollView.contentOffset.x;
        let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW);
        self.pageControl!.currentPage = page;
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.removeTimer();
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.addTimer();
    }
    
    
    func addTimer(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "nextImage:", userInfo: nil, repeats: true);
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes);
    }
    
    func removeTimer(){
        self.timer!.invalidate();
    }
    
    func nextImage(sender:AnyObject!){
        var page:Int = self.pageControl!.currentPage;
        if(page == 3)
        {
            page = 0;
        }
        else
        {
            ++page;
        }
        let x:CGFloat = CGFloat(page) * self.scrollView!.frame.size.width;
        self.scrollView!.contentOffset = CGPointMake(x, 0);
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
