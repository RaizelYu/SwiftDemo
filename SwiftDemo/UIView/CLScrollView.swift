//
//  CLScrollView.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/26.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//  自定义轮播图

import UIKit

class CLScrollView: UIView,UIScrollViewDelegate {
    var scrollView:UIScrollView?
    var timer     :NSTimer?
    var dataSourceArr:NSMutableArray?
    var pageControl     :UIPageControl?
    var currIndex:NSInteger?            //当前索引
    var arrContentView:NSMutableArray?  //scrollView子控件
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initView(frame:CGRect, arr:NSArray){
        self.dataSourceArr = NSMutableArray()
        self.dataSourceArr?.addObjectsFromArray(arr as [AnyObject])
        self.arrContentView = NSMutableArray()
        
        self.frame = frame
        self.scrollView = UIScrollView(frame:self.bounds)
        self.scrollView?.delegate = self
//        self.scrollView?.scrollEnabled = true
        self.scrollView?.pagingEnabled = true
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.showsVerticalScrollIndicator = false
        self.scrollView?.contentSize = CGSizeMake(KScreenWidth*3, 0)
        self.scrollView?.minimumZoomScale=1
        self.scrollView?.maximumZoomScale=1
        self.addSubview(self.scrollView!)
        
        self.pageControl = UIPageControl(frame: CGRectMake((KScreenWidth-200)/2, 180, 200, self.scrollView!.frame.size.height-180))
        self.pageControl?.numberOfPages = self.dataSourceArr!.count
        self.pageControl?.currentPage = 0
        self.pageControl?.currentPageIndicatorTintColor = UIColor.greenColor()
        self.pageControl?.pageIndicatorTintColor = UIColor.yellowColor()
        self.addSubview(self.pageControl!)

        self.currIndex = 0;
        self.viewWithScroll()       //初始化
//        self.scrollView?.contentOffset = CGPointMake(self.scrollView!.frame.size.width,0)
        self.initTimer()
        }
    
    func currPage(index:NSInteger)->NSInteger{
        var indexReturn:NSInteger = index
        if index < 0{
            var objLast: AnyObject? = self.dataSourceArr?.lastObject
            for var i=0; i<self.dataSourceArr!.count; i++ {
                var flag:Bool = objLast!.isEqual(self.dataSourceArr?.objectAtIndex(i))
                if flag{
                    indexReturn = i;
                    break
                }
            }
        }
        if indexReturn >= self.dataSourceArr?.count{
            indexReturn = 0
        }
        return indexReturn
    }
    
    func viewWithScroll(){
        //添加对应索引的数据源
        var indexFirst:Int = self.currPage(self.currIndex!-1)
        var indexSecond:Int = self.currPage(self.currIndex!)
        var indexThird:Int = self.currPage(self.currIndex! + 1)
        if self.arrContentView?.count <= 0 {
            var  off_X:CGFloat = 0
            var imgView:UIImageView = UIImageView(frame: CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
            var url = NSURL(string: self.dataSourceArr?.objectAtIndex(indexFirst) as! String)
//            imgView.sd_setImageWithURL(url, placeholderImage: UIImage(named: toString(indexFirst)))
            imgView.image = UIImage(named: toString(indexFirst))
            self.scrollView?.addSubview(imgView)
            self.arrContentView?.addObject(imgView)
    
            off_X += self.scrollView!.frame.size.width
            var imgViewMid:UIImageView =  UIImageView(frame:CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
            var urlMid = NSURL(string: self.dataSourceArr?.objectAtIndex(indexSecond) as! String)
//            imgViewMid.sd_setImageWithURL(urlMid, placeholderImage: UIImage(named: toString(indexSecond)))
            imgViewMid.image = UIImage(named: toString(indexSecond))
            self.scrollView?.addSubview(imgViewMid)
            self.arrContentView?.addObject(imgViewMid)
            
            off_X += self.scrollView!.frame.size.width
            var imgViewRig:UIImageView  = UIImageView(frame: CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
            var urlRig = NSURL(string: self.dataSourceArr?.objectAtIndex(indexThird) as! String)
//            imgViewRig.sd_setImageWithURL(urlRig, placeholderImage: UIImage(named: toString(indexThird)))
            imgViewRig.image = UIImage(named: toString(indexThird))
            self.scrollView?.addSubview(imgViewRig)
            self.arrContentView?.addObject(imgViewRig)
        }
        else {
            var arrIndex:NSArray = [String(indexFirst),String(indexSecond),String(indexThird)]
            for var j=0; j<self.arrContentView?.count; j++ {
                var imgView:UIImageView = self.arrContentView!.objectAtIndex(j) as! UIImageView
//                imgView.frame = CGRectMake(imgView.frame.origin.x, 0, imgView.frame.size.width, imgView.frame.size.height)
                imgView.image = UIImage(named:arrIndex.objectAtIndex(j) as! String)
            }
        }
        
        self.scrollView?.setContentOffset(CGPointMake(self.scrollView!.frame.size.width, 0), animated: false)
        
//        var arr = self.scrollView?.subviews  as! NSArray
//        for var i=0; i<arr.count; i++ {
//            arr[i].removeFromSuperview()
//        }
        
//        //添加对应索引的数据源
//        var indexFirst:Int = self.currPage(self.currIndex!-1)
//        var indexSecond:Int = self.currPage(self.currIndex!)
//        var indexThird:Int = self.currPage(self.currIndex! + 1)
//        
//        
//        var  off_X:CGFloat = 0
//        var imgView:UIImageView = UIImageView(frame: CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
//        var url = NSURL(string: self.dataSourceArr?.objectAtIndex(indexFirst) as! String)
//        imgView.sd_setImageWithURL(url, placeholderImage: UIImage(named: toString(indexFirst)))
////        imgView.image = UIImage(named: toString(indexFirst))
//        self.scrollView?.addSubview(imgView)
//        
//        off_X += self.scrollView!.frame.size.width
//        var imgViewMid:UIImageView =  UIImageView(frame:CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
//        var urlMid = NSURL(string: self.dataSourceArr?.objectAtIndex(indexSecond) as! String)
//        imgViewMid.sd_setImageWithURL(urlMid, placeholderImage: UIImage(named: toString(indexSecond)))
////        imgViewMid.image = UIImage(named: toString(indexSecond))
//        self.scrollView?.addSubview(imgViewMid)
//
//        off_X += self.scrollView!.frame.size.width
//        var imgViewRig:UIImageView  = UIImageView(frame: CGRectMake(off_X, 0, self.scrollView!.frame.size.width, self.scrollView!.frame.size.height))
//        var urlRig = NSURL(string: self.dataSourceArr?.objectAtIndex(indexThird) as! String)
//        imgViewRig.sd_setImageWithURL(urlRig, placeholderImage: UIImage(named: toString(indexThird)))
////        imgViewRig.image = UIImage(named: toString(indexThird))
//        self.scrollView?.addSubview(imgViewRig)
//
//        self.scrollView?.setContentOffset(CGPointMake(self.scrollView!.frame.size.width, 0), animated: true)
    }
    
    func initTimer(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "scrollChange:", userInfo: nil, repeats: true)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollChange(timer:NSTimer){
//        self.scrollView?.setContentOffset(CGPointMake(2*self.scrollView!.frame.size.width, 0), animated: true)
        println("定时器事件")
        self.currIndex = self.currPage(self.currIndex!+1)
        self.pageControl?.currentPage = self.currIndex!
        println(self.currIndex)
        self.viewWithScroll()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var contentOffsetX:CGFloat = self.scrollView!.contentOffset.x
        println(contentOffsetX)
        if contentOffsetX >= 2*self.scrollView!.frame.size.width {
            self.currIndex = self.currPage(self.currIndex!+1)
            self.pageControl?.currentPage = self.currIndex!
            self.viewWithScroll()
        }
        if contentOffsetX <= 0 {
            self.currIndex = self.currPage(self.currIndex!-1)
            self.pageControl?.currentPage = self.currIndex!
            self.viewWithScroll()
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.stopTimer();
    }
//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        println("停止滑动")
          self.refumeTimer();
    }
    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//
//    }

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
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
