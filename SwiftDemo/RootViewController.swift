//
//  RootViewController.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/12.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit


class RootViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
        var tableView:UITableView?
        var arrData:NSArray?
//        var leftBtn:UIButton?
//        var label:UILabel?
//        var item:[;"武汉","上海"]
//        let item:["catfish", "water", "tulips", "blue paint"]
//    var shoppingList:NSArray = ["catfish", "water", "tulips", "blue paint"]
//    let na:NSArray = ["Pencil","Eraser", "Notebkko"]
//    var na:[String] = ["hello", "swift"]
//    var arrData:NSMutableArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "swiftDemo"
        self.arrData = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UITableView","UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView"]
//        self.arrData = NSMutableArray(array: String())
//        self.arrData?.addObject("123")
//        self.label = UILabel(frame: CGRectMake(100, 100, 100, 40))
//        self.label!.text = "哈哈,swift好玩"
//        self.label!.textColor = UIColor.redColor()
//        self.label!.backgroundColor = UIColor.clearColor()
//        self.label!.font = UIFont.systemFontOfSize(14)
//        self.view.addSubview(self.label!)
//        
//        self.leftBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
//        self.leftBtn! = UIButton(frame: CGRectMake(100, 140, 100, 40));
//        self.leftBtn!.backgroundColor = UIColor.blueColor()
//        self.leftBtn!.setTitle("哈哈", forState: UIControlState.Normal)
//        self.leftBtn!.addTarget(self, action: "btnAction", forControlEvents: UIControlEvents.TouchUpInside);
//        self.view.addSubview(self.leftBtn!)
//        var view = UIView.alloc()
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, 350, 400))
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.backgroundColor = UIColor.clearColor()
        self.tableView!.backgroundView = UIView()
        self.view.addSubview(self.tableView!)
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "轮播图", style: UIBarButtonItemStyle.Bordered, target: self, action: "rightAction:")
        
//        self.navigationItem.leftBarButtonItem
//        println(value: self.shoppingList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rightAction(sender:AnyObject){
        println("轮播图")
        var loadVc = LoadViewController()
        self.navigationController?.pushViewController(loadVc, animated: true)
    }

    func btnAction(){
        println("123")
//        NSLogv(<#format: String!#>, <#args: CVaListPointer#>)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.arrData!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.arrData?.objectAtIndex(indexPath.row) as! String
//        cell.textLabel?.text = self.shoppingList(indexPath.row)
//        cell.textLabel?.text = self.shoppingList!(indexPath.row)
//        cell.textLabel?.text = self.shoppingList[indexPath.row] as! String;
//        cell.textLabel?.text = "123";
//        cell.textLabel?.text =
        return cell;
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!)
//    {
//        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        if indexPath.row == 0{
//            var labelVc = LabelViewController.alloc()
//            self.navigationController?.pushViewController(labelVc, animated: true)
//        }
//    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {
            var labelVc = LabelViewController.alloc()
            self.navigationController?.pushViewController(labelVc, animated: true)
        }
        else if indexPath.row == 1{
            var btnVc = ButtonViewController.alloc()
            self.navigationController?.pushViewController(btnVc, animated: true)
        }
        else if indexPath.row == 2{
            var imgVc = ImageViewViewController.alloc()
            self.navigationController?.pushViewController(imgVc, animated: true)
        }else if indexPath.row == 4{
            var webView = WebViewController()
            self.navigationController?.pushViewController(webView, animated: true)
        }else if indexPath.row == 7{
            var textFieldVc = UITextFieldViewController()
            self.navigationController?.pushViewController(textFieldVc, animated: true)
        }else if indexPath.row == 8{
            var scrolVc = ScrollViewController()
            self.navigationController?.pushViewController(scrolVc, animated: true)
        }else if indexPath.row == 9 {
            var tabVc = TableViewController()
            self.navigationController?.pushViewController(tabVc, animated: true)
        }else{
           var norVc = NormalViewController()
            self.navigationController?.pushViewController(norVc, animated: true)
        }
    }
    
//    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell!{
//        
//        let cell = UITableViewCell(style:.Default, reuseIdentifier:"myCell")
//        
//        cell.textLabel.text = "swift cell \(indexPath.row)"
//        
//        return cell
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
