//
//  BLUtility.h
//  HJDataSave
//
//  Created by HeJay on 8/24/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLUtility : NSObject

+ (NSString *)getPathWithinDocumentDir:(NSString *)aPath;
+ (BOOL) createDirectory:(NSString *)dirPath lastComponentIsDirectory:(BOOL)isDir;
+ (BOOL) removeFile:(NSString *)filePath;

+ (NSData *)archiverObject:(NSObject *)object forKey:(NSString *)key;
+ (NSObject *)unarchiverObject: (NSData *)archivedData withKey: (NSString *)key;

@end
