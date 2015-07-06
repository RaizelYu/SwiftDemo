//
//  CustomTableViewCell.swift
//  SwiftDemo
//
//  Created by chenliang on 15/5/18.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var label:UILabel?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.label = Apputil.alloc().initLabel(CGRectZero, text: "", color: UIColor.blackColor())
        self.label?.font = UIFont.systemFontOfSize(14)
        self.label?.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(self.label!)
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.label?.mas_left = 10
    }
    
    func cellForData(str:String){
        if !str.isEmpty{
            self.label?.text = str
        }
    }
    
    func cellForHeight() -> CGFloat{
        return UIFont.systemFontOfSize(14).lineHeight + 20
    }
}
