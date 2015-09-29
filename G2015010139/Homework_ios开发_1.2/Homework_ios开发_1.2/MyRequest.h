//
//  MyRequest.h
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

typedef void(^Success)(id responseObject);
typedef void(^Failure)(NSError * error);

@interface MyRequest : NSObject

@property(nonatomic, strong)NSURLConnection *URLConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, strong)NSURLSessionTask *task;
@property(nonatomic, copy) Success success;
@property(nonatomic, copy) Failure failure;
@property(nonatomic, strong) NSDate * begin;
@property(nonatomic, strong) NSDate * end;

- (void)RequestWithURL:(NSString *)url Success:(void (^)(id responseObject))success Failure:(void (^)(NSError * error))failure;

- (NSTimeInterval)DownloadTime;

- (void)cancelRequest;
@end
