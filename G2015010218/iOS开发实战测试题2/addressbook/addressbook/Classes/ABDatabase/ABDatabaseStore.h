//
//  ABDatabaseStore.h
//  addressbook
//
//  Created by 黄纪银163 on 15/9/5.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  管理存取数据

#import <Foundation/Foundation.h>
@class ABSchoolmate;

@interface ABDatabaseStore : NSObject
/** 保存一条信息内容 */
- (void) saveAdress:(ABSchoolmate *)schoolmate;

/** 通过名字读取一条信息内容 */
- (ABSchoolmate *) getAdressWithName:(NSString *)name;

/** 拿到全部名册 */
- (NSArray *) getAllAdress;

/** 删除某个同学 */
- (void) deletedWithName:(NSString *)name;

@end
