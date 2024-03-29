//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/12.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window      : UIWindow?
    var windowView  : WindowViewController?
    var naviRoot    : UINavigationController?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        let splitViewController = self.window!.rootViewController as! UISplitViewController
//        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
//        navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
//        splitViewController.delegate = self
//        return true
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
//        self.test()
        self.rootWindowView()
        return true;
    }

    func rootWindowView(){
        self.windowView = WindowViewController()
        self.windowView?.initView()
        self.naviRoot = UINavigationController(rootViewController: self.windowView!)
//        self.naviRoot?.navigationBarHidden = true
//        self.window?.rootViewController = self.naviRoot
        
        self.windowView?.setNav(self.naviRoot!)
        self.windowView?.setPresetntMainView()
    }
    
    func test(){
        var root = RootViewController.alloc()
        var navi = UINavigationController(rootViewController: root);
        self.window!.rootViewController = navi;
    }
    
   
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view
}

