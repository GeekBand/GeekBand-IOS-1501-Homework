//
//  FileManager&plist.h
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager_plist : NSObject

+ (NSString*) getPathWithinDocumentDir:(NSString*)aPath;
+ (BOOL) createDirectory:(NSString*)dirPath lastComponentIsDirectory:(BOOL)isDir;
+ (BOOL) removeFile:(NSString *)filePath;

+ (NSData *) archiverObject:(NSObject *)object forKey:(NSString *)key;
+ (NSObject *) unarchiverObject:(NSData *)archivedData withKey:(NSString *)key;

@end
