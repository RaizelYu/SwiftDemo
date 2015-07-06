//
//  ResponObj.h
//  SwiftDemo
//
//  Created by chenliang on 15/5/22.
//  Copyright (c) 2015年 chenliang. All rights reserved.
//

#import "JSONModel.h"

@interface ResponObj : JSONModel
@property(nonatomic,strong)NSString<Optional>* advance;
@property(nonatomic,strong)NSString<Optional>* experience;
@property(nonatomic,strong)NSString<Optional>* member_id;
@property(nonatomic,strong)NSString<Optional>* member_lv_id;
@property(nonatomic,strong)NSString<Optional>* order_num;
@property(nonatomic,strong)NSString<Optional>* point;
@end
