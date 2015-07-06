//
//  Apputil.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class Apputil: NSObject {
    func initLabel(frame:CGRect, text:String, color:UIColor) -> UILabel{
        var lbl = UILabel(frame: frame)
        lbl.text = text
        lbl.backgroundColor = UIColor.clearColor()
        lbl.textColor = color
        return lbl
    }
    
    func initButton(frame:CGRect, text:String, tapAction:Selector, target:AnyObject, bgColor:UIColor, textColor:UIColor) -> UIButton
    {
        var btn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        btn.frame = frame
        btn.setTitle(text, forState: UIControlState.Normal)
        btn.addTarget(target, action: tapAction, forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = bgColor
        btn.setTitleColor(textColor, forState: UIControlState.Normal)
        return btn
    }
    
    func initImageView(frame:CGRect, image:UIImage) -> UIImageView{
        var imgView = UIImageView(frame: frame)
        imgView.image = image;
        return imgView
    }
}
