//
//  BLUtility.h
//  BLDataSaveDemo
//
//  Created by duansong on 15-7-14.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BLUtility : NSObject {

}

+ (NSString*) getPathWithinDocumentDir:(NSString*)aPath;
+ (BOOL) createDirectory:(NSString*)dirPath lastComponentIsDirectory:(BOOL)isDir;
+ (BOOL) removeFile:(NSString *)filePath;

+ (NSData *) archiverObject:(NSObject *)object forKey:(NSString *)key;
+ (NSObject *) unarchiverObject:(NSData *)archivedData withKey:(NSString *)key;

@end
