//
//  ZOPGETDataRequest.m
//  网络请求
//
//  Created by 黄纪银163 on 15/8/18.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  获取网络数据请求类

#import "ZOPGETDataRequest.h"

@interface ZOPGETDataRequest ()

@end

static NSOperationQueue *_queue; // 操作队列

@implementation ZOPGETDataRequest {
    NSURLSession    *_dataTaskSession;
    NSURLSession    *_downloadTaskSession;
}

#pragma mark - Public Methods
- (NSURLSessionDataTask *) dataTaskWithURL:(NSString *)URLStr
                                 parameter:(NSDictionary *)parameter
                             configuration:(NSURLSessionConfiguration *)configuration
                           requestFinished:(RequestFinishedData)finished
{
    // 拼url参数
    // 字符串编码
    URLStr = [[self URLString:URLStr appendURLParameter:parameter]
              stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // 会话创建
    if (configuration) {
        _dataTaskSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    else
    {
        _dataTaskSession = [NSURLSession sharedSession];
    }
    
    NSURL *url = [NSURL URLWithString:URLStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 会话请求数据
    NSURLSessionDataTask *dataTask = [_dataTaskSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          if (finished) {
              if (error) {
                  // 出错
                  finished(nil, error);
              }
              else
              {
                  // 请求成功
                  finished(data, nil);
              }
          }
      }];

    [dataTask resume];
    
    return dataTask;
}

- (NSURLSessionDataTask *) dataTaskWithURL:(NSString *)URLStr
                                 parameter:(NSDictionary *)parameter
                           requestFinished:(RequestFinishedData)finished
{
    return [self dataTaskWithURL:URLStr parameter:parameter configuration:nil requestFinished:finished];
}

- (NSURLSessionDownloadTask *)downloadTaskWithURL:(NSString *)URLStr
                                    configuration:(NSURLSessionConfiguration *)configuration
                                  requestFinished:(RequestFinishedDownload)finished
{
    URLStr = [URLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if (configuration) {
        _downloadTaskSession = [NSURLSession sessionWithConfiguration:configuration];
    }
    else
    {
        _downloadTaskSession = [NSURLSession sharedSession];
    }
    
    NSURL *url = [NSURL URLWithString:URLStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *downloadTask = [_downloadTaskSession downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (finished) {
            if (error) {
                // 出错
                finished(nil, error);
            }
            else
            {
                // 成功
                finished(location, nil);
            }
        }
    }];
    // 开始
    [downloadTask resume];
    
    return downloadTask;
}

- (NSURLSessionDownloadTask *)downloadTaskWithURL:(NSString *)URLStr requestFinished:(RequestFinishedDownload)finished
{
    return [self downloadTaskWithURL:URLStr configuration:nil requestFinished:finished];
}

#pragma mark - Private Methods
/** 拼接URL参数字符串 */
- (NSString *) URLString:(NSString *)URLStr appendURLParameter:(NSDictionary *)parameter
{
    if (parameter.count > 0) {
        
        NSArray *keys = [parameter allKeys];
        NSInteger count = keys.count;
        
        id key = nil;
        id obj = nil;
        NSMutableString *paramStr = [NSMutableString string];
        
        // 算出是否最后一个参数
        for (NSInteger i = 0; i<count; i++) {
            key = keys[i];
            obj = [parameter objectForKey:key];
            
            if ([key isKindOfClass:[NSString class]] && [obj isKindOfClass:[NSString class]]) {
                if (i == count-1) {
                    [paramStr appendFormat:@"%@=%@", key, obj];
                }
                else
                {
                    [paramStr appendFormat:@"%@=%@&", key, obj];
                }
            }
        }
        
        // 拼接开始
        URLStr = [NSString stringWithFormat:@"%@?%@", URLStr, paramStr];
    }
    
    return URLStr;
}

#pragma mark - Memery Control
- (void)dealloc
{
    NSLog(@"GETDataRequest dealloc");
}

#pragma mark - NSURLSessionDownloadDelegate

#pragma mark - NSURLSesstionDataDelegate

#pragma mark - NSURLSessionTaskDelegate Methods

#pragma mark - NSURLSessionDelegate Methods


@end
