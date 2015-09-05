//
//  ABSchoolmate.h
//  addressbook
//
//  Created by 黄纪银163 on 15/9/5.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABSchoolmate : NSObject
@property (nonatomic, copy) NSString * name;          // 名称
@property (nonatomic, strong) NSNumber * age;         // 年纪
@property (nonatomic, copy) NSString * phoneNumber;   // 电话
@property (nonatomic, copy) NSString * remark;        // 备注
@property (nonatomic, copy) NSString * icon;          // 头像
@property (nonatomic, copy) NSString * address;       // 地址
@property (nonatomic, strong) NSNumber * qq;          // QQ
@end
