//
//  NamedShape.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/13.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class NamedShape: NSObject {
    var numberOfSides: Int = 0
    var name: String = ""
    
//    init(name: String) {
//        self.name = name
//    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func sumAdd(num:Int, num2:Int) -> Int{
        return num + num2
    }
}
