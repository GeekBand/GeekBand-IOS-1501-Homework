//
//  GWClassmateDBManager.h
//  Classmates
//
//  FMDB的一个管理器封装了常用的数据库增删改查的方法
//
//  Created by Will Ge on 9/1/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "GWClassmate.h"

@interface GWClassmateDBManager : NSObject {
    /**
     *  创建一个 FMDatabase 实例
     */
    FMDatabase *_db;
}

/**
 *  创建一个 classmate 的表
 *
 *  @return 是否创建成功
 */
- (BOOL) createClassmateTable;

/**
 *  新增一个 classmate
 *
 *  @param classmate  待添加的 classmate
 *
 *  @return  是否新增成功
 */
- (BOOL) addClassmate:(GWClassmate *)classmate;
/**
 *  查询所有 classmate
 *
 *  @return  包含所有 classmate 的数组
 */
- (NSMutableArray *) getAllClassmate;

/**
 *  查询指定 uuid 的 classmate
 *
 *  @param uuid  待查询的 classmate 的 uuid
 *
 *  @return  查询到的 classmate
 */
- (GWClassmate *) getClassmateByUuid:(NSString *)uuid;

@end
