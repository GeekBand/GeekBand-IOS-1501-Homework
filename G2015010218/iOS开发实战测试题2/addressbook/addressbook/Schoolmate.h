//
//  Schoolmate.h
//  addressbook
//
//  Created by 黄纪银163 on 15/9/1.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Schoolmate : NSManagedObject

@property (nonatomic, retain) NSString * name;          // 名称
@property (nonatomic, retain) NSNumber * age;           // 年纪
@property (nonatomic, retain) NSString * phoneNumber;   // 电话
@property (nonatomic, retain) NSString * remark;        // 备注
@property (nonatomic, retain) NSString * icon;          // 头像
@property (nonatomic, retain) NSString * address;       // 地址
@property (nonatomic, retain) NSNumber * qq;            // QQ

@end
