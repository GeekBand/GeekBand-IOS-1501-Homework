//
//  ZOPGETDataRequest.h
//  网络请求
//
//  Created by 黄纪银163 on 15/8/18.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  获取网络数据请求类

#import <Foundation/Foundation.h>

// 请求成功与失败后调用的Block
typedef void(^RequestFinishedData)(NSData *data, NSError *error);
typedef void(^RequestFinishedDownload)(NSURL *location, NSError *error);

@interface ZOPGETDataRequest : NSObject

/**
 URLStr             : URL地址字符串;
 parameter          : 请求参数字典;
 requestFinished    : 完成后回调的Block;
 return             : URL数据任务;
 */
- (NSURLSessionDataTask *) dataTaskWithURL:(NSString *)URLStr
                                 parameter:(NSDictionary *)parameter
                           requestFinished:(RequestFinishedData)finished;

/**
 URLStr             : URL地址字符串;
 parameter          : 请求参数字典;
 configuration      : 会话配置;
 requestFinished    : 完成后回调的Block;
 return             : URL数据任务;
 */
- (NSURLSessionDataTask *) dataTaskWithURL:(NSString *)URLStr
                                 parameter:(NSDictionary *)parameter
                             configuration:(NSURLSessionConfiguration *)configuration
                           requestFinished:(RequestFinishedData)finished;

/**
 URLStr             : URL地址字符串;
 requestFinished    : 完成后回调的Block;
 return             : URL下载任务;
 */
- (NSURLSessionDownloadTask *) downloadTaskWithURL:(NSString *)URLStr
                                   requestFinished:(RequestFinishedDownload)finished;

/**
 URLStr             : URL地址字符串;
 configuration      : 会话配置;
 requestFinished    : 完成后回调的Block;
 return             : URL下载任务;
 */
- (NSURLSessionDownloadTask *) downloadTaskWithURL:(NSString *)URLStr
                                 configuration:(NSURLSessionConfiguration *)configuration
                               requestFinished:(RequestFinishedDownload)finished;

@end
