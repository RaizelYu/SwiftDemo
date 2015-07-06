//
//  TableViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tabView   :UITableView?
//    var dictionary:NSDictionary?
    var arrData   :NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Table Demo"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tabView = UITableView(frame: CGRectMake(0, 0, 350, 400))
        self.tabView?.dataSource = self
        self.tabView?.delegate = self
        self.tabView?.backgroundColor = UIColor.clearColor()
        self.tabView?.backgroundView = UIView()
//        self.tableView?.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tabView!)
        
        self.arrData = ["1","2","3","4"]
//        self.dictionary = ["a":"0","b":"1","c":"2","d":"3"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData!.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CustomTableViewCell.alloc().cellForHeight()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        //cell.textLabel?.text = self.dictionary!.objectForKey(array.objectAtIndex(indexPath.row)) as! String
        //return cell
        
        let identifierString = "identifierString"
        var cell:CustomTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifierString) as? CustomTableViewCell;
        if cell == nil{
            cell = CustomTableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: identifierString);
            println("%d",indexPath.row);
        }
        cell.cellForData(self.arrData?.objectAtIndex(indexPath.row) as! String)
        return cell;
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
