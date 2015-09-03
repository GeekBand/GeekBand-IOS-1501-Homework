//
//  GWArchiver.h
//
//  Created by duansong on 15-7-14.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GWArchiver : NSObject {

}

/**
 *  添加目录或文件并获得完整的 Documents 目录
 *
 *  @param aPath 待添加目录或文件
 *
 *  @return 完整的 Documents 的目录
 */
+ (NSString*) getPathWithinDocumentDir:(NSString*)aPath;

/**
 *  创建目录
 *
 *  @param dirPath 待创建的目录
 *  @param isDir   结尾是否是目录
 *
 *  @return 是否创建成功
 */
+ (BOOL) createDirectory:(NSString*)dirPath lastComponentIsDirectory:(BOOL)isDir;

/**
 *  删除目录
 *
 *  @param filePath 待删除目录
 *
 *  @return 是否删除目录成功
 */
+ (BOOL) removeFile:(NSString *)filePath;

/**
 *  归档
 *
 *  @param object 待归档的对象
 *  @param key     key
 *
 *  @return  归档完成的 NSData
 */
+ (NSData *) archiverObject:(NSObject *)object forKey:(NSString *)key;

/**
 *  解档
 *
 *  @param archivedData 待解档的 NSData
 *  @param key           key
 *
 *  @return  解档完成的对象
 */
+ (NSObject *) unarchiverObject:(NSData *)archivedData withKey:(NSString *)key;

@end
