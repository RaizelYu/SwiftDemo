//
//  RequestManager.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/19.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

let  BaseUrl = "http://xindonglin.ecdo.cc/commapi.html"
//typealias void(^successBlock)(AnyObject obj, String* aUrlKey)
typealias successBlock = (dic:NSDictionary)-> Void
typealias failedBlock = (dic:NSDictionary)->  Void

class RequestManager: NSObject {
    var afnManager:AFHTTPRequestOperationManager?
    class func shareInstance()->RequestManager{
        struct YRSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:RequestManager? = nil
        }
        dispatch_once(&YRSingleton.predicate,{
            YRSingleton.instance=RequestManager()
            }
        )
        return YRSingleton.instance!
    }
    
    func doTaskRequest(dic:NSDictionary,success:successBlock, failed:failedBlock)
    {
        if self.afnManager == nil
        {
            self.afnManager = AFHTTPRequestOperationManager()
            self.afnManager?.requestSerializer = AFJSONRequestSerializer()
            self.afnManager?.responseSerializer = AFJSONResponseSerializer()
//                _afnManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
            var arr = ["application/json", "text/json", "text/javascript","text/html","text/plain"]
            self.afnManager?.responseSerializer.acceptableContentTypes = NSSet(object: arr) as Set<NSObject>
        }
        
        self.afnManager?.GET(BaseUrl, parameters: dic, success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) -> Void in
                println("success")
//                success(str: operation.responseString)
            }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) -> Void in
                println("failed")
//                failed(str: operation.responseString)
                
                
                var jsonData = operation.responseString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) as NSData!
                var err:NSError
                var dic = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                failed(dic:dic)
//                var dic = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &err)
//                NSError *err;
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                    options:NSJSONReadingMutableContainers
//                    error:&err];
//                var  bol:Bool  =  NSJSONSerialization.isValidJSONObject(operation.responseString)
//                println(bol)
//                operation.responseString
                
//                let data:NSData! = NSJSONSerialization.dataWithJSONObject(operation.responseString, options: nil, error: nil)
//                var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
//                println(json)
//                NSJSONSerialization.j
                //[string objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
                
//                operation.responseString
//                json
//                var dic = operation.responseString
//                successBlock(operation.responseString)
//                var str = (dic as! NSDictionary).objectForKey("message") as! String
//                println(str)
//                println(operation.responseString)
//                var dic = operation.responseObject;
//                var str = (dic as! NSDictionary).objectForKey("message") as! String
//                println(str)
        })
    }
}
