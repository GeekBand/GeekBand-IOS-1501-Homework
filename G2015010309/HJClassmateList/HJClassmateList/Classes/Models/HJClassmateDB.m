//
//  HJClassmateDB.m
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJClassmateDB.h"
#import "BLUtility.h"

#define CLASSMATEDBNAME @"classmates.sqlite"

@implementation HJClassmateDB

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *dbpath = [BLUtility getPathWithinDocumentDir: CLASSMATEDBNAME];
        _db = [FMDatabase databaseWithPath:dbpath];
        
        if ([_db open] == NO) {
            return nil;
        }
    }
    
    return self;
}

- (BOOL)createClassmateTable {
    [_db beginTransaction];
    BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS CLASSMATETABLE("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "name TEXT NOT NULL,"
                    "comment TEXT NOT NULL,"
                    "imageinBundle BOOL NOT NULL,"
                    "imageName TEXT NOT NULL);"];
    [_db commit];
    
    if (!success || [_db hadError]) {
        [_db rollback];
        return NO;
    }
    
    return YES;
}

- (BOOL)addClassmate:(HJClassmate *)classmate {
    FMResultSet *rs = [_db executeQuery:@"SELECT NAME FROM CLASSMATETABLE WHERE NAME=?", classmate.name];
    if (rs && [rs next]) {
        [rs close];
        return YES;
    }
    [rs close];
    
    [_db beginTransaction];
    
    BOOL success = [_db executeUpdate:@"INSERT OR IGNORE INTO CLASSMATETABLE (name, comment, imageInBundle, imageName) VALUES (?,?,?,?);",
                    classmate.name,
                    classmate.comment,
                    [NSNumber numberWithBool:classmate.imageInBundle],
                    classmate.imageName];
    [_db commit];
    if (!success || [_db hadError]) {
        [_db rollback];
        return NO;
    }
    
    return YES;
}

- (NSMutableArray *)getAllClassmates {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    FMResultSet *rs = [_db executeQuery:@"SELECT * FROM CLASSMATETABLE"];
    
    while ([rs next]) {
        HJClassmate *classmate = [[HJClassmate alloc] init];
        classmate.classmateID = [rs intForColumn:@"id"];
        classmate.name = [rs stringForColumn:@"name"];
        classmate.comment = [rs stringForColumn:@"comment"];
        classmate.imageInBundle = [rs boolForColumn:@"imageInBundle"];
        classmate.imageName = [rs stringForColumn:@"imageName"];
        [result addObject:classmate];
    }
    
    [rs close];
    return result;
}

- (BOOL)deleteClassmateWithName:(NSString *)aName {
    [_db beginTransaction];
    BOOL success = [_db executeUpdate:@"DELETE FROM CLASSMATETABLE WHERE name=?", aName];
    [_db commit];
    if (!success || [_db hadError]) {
        [_db rollback];
        return NO;
    }
    return YES;

}

- (BOOL)tableExists {
    FMResultSet *rs = [_db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?",@"CLASSMATETABLE"];
    while ([rs next])
    {
        NSInteger count = [rs intForColumn:@"count"];

        if (0 == count)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    
    return NO;
}

@end
