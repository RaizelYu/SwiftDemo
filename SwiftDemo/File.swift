//
//  File.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/20.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import Foundation

let IOS = (UIDevice.currentDevice().systemVersion.toInt() >= 7)

let KScreenWidth:CGFloat  = UIScreen.mainScreen().bounds.size.width
let KScreenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height
let K_VC_Y:CGFloat        = IOS ? 64.0 : 44.0
let K_VC_StuBar:CGFloat   = IOS ? 20.0 : 0
let K_Tab_Height:CGFloat  = 49


enum WeekDays: Int{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
