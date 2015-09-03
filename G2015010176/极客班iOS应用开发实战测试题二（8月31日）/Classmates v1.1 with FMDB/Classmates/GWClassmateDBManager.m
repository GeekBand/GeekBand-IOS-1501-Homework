//
//  GWClassmateDBManager.m
//  Classmates
//
//  Created by Will Ge on 9/1/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWClassmateDBManager.h"
#import "GWArchiver.h"


#define kGWClassmateDBName @"GWGWClassmateDB.sqlite"


@implementation GWClassmateDBManager

/**
 *  初始化管理器，并检查数据库是否存在
 *
 *  @return 初始化得到的管理器
 */
- (id) init {
    
    self = [super init];
    
    if (self) {
        
        NSString *dbPath = [GWArchiver getPathWithinDocumentDir:kGWClassmateDBName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL existFile = [fileManager fileExistsAtPath:dbPath];
        if (existFile == NO) {
            // Copy to sandbox from application bundle
            NSString *poemDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:kGWClassmateDBName];
            [fileManager copyItemAtPath:poemDBPath toPath:dbPath error:nil];
        }

        _db = [[FMDatabase alloc] initWithPath:dbPath];
        if ([_db open] == NO) {
            return nil;
        }
    }
    
    return self;
    
}


- (BOOL) createClassmateTable {
    
    
    [_db beginTransaction];
    BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS CLASSMATETABLE ("
                    @"UUID TEXT,"
                    @"NAME TEXT,"
                    @"INFO TEXT,"
                    @"Avatar BLOB);"];
                    
    [_db commit];
    
    if (!success || [_db hadError]) {
        [_db rollback];
        return NO;
    }
    
    return YES;
}


- (BOOL) addClassmate:(GWClassmate *)classmate {
    
//    // 先检查是否存在，如果已经存在就直接返回：创建成功
//    FMResultSet *rs = [_db executeQuery:@"SELECT UUID FROM CLASSMATETABLE WHERE UUID=?",classmate.uuid];
//    if(rs && [rs next]) {
//        [rs close];
//        return YES;
//    }
//    [rs close];
    
    // 开始创建新的 classmate
    [_db beginTransaction];
    
    BOOL success = [_db executeUpdate:@"INSERT OR IGNORE INTO CLASSMATETABLE (UUID,NAME,INFO,Avatar) VALUES (?,?,?,?);",
                    classmate.uuid,
                    classmate.name,
                    classmate.info,
                    classmate.avatar];
    
    [_db commit];
    
    if(!success || [_db hadError]) {
        [_db rollback];
        return NO;
    }
    return YES;
}


- (NSMutableArray *) getAllClassmate {
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    FMResultSet *rs = [_db executeQuery:@"SELECT * FROM CLASSMATETABLE"];
    
    while ([rs next]) {
        
        GWClassmate *classmate = [[GWClassmate alloc] init];
        
        classmate.uuid   = [rs stringForColumn:@"UUID"];
        classmate.name   = [rs stringForColumn:@"NAME"];
        classmate.info   = [rs stringForColumn:@"INFO"];
        classmate.avatar = [rs dataForColumn:@"Avatar"];
        
        [results addObject:classmate];
    }
    
    [rs close];
    
    return results;
}


- (GWClassmate *) getClassmateByUuid:(NSString *)uuid {
    
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    FMResultSet *rs = [_db executeQuery:@"SELECT * FROM CLASSMATETABLE WHERE UUID=?",
                       uuid];
    
    while ([rs next]) {
        
        GWClassmate *classmate = [[GWClassmate alloc] init];
        
        classmate.uuid   = [rs stringForColumn:@"UUID"];
        classmate.name   = [rs stringForColumn:@"NAME"];
        classmate.info   = [rs stringForColumn:@"INFO"];
        classmate.avatar = [rs dataForColumn:@"Avatar"];
        
        [results addObject:classmate];
    }
    
    [rs close];
    
    GWClassmate *theClassmte = [[GWClassmate alloc] init];
    theClassmte = results[0];
    
    return theClassmte;
    
}

@end
