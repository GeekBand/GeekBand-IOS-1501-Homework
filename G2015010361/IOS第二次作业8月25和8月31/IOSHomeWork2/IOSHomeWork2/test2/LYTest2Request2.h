//
//  LYTest2Request2.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class LYTest2Request2;

@protocol LYTest2Request2Delegate <NSObject>
@optional
- (void)requestSuccess2:(LYTest2Request2 *)request;
- (void)requestFailed2:(LYTest2Request2 *)request error:(NSError *)error;

@end

@interface LYTest2Request2 : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic, strong)NSURLConnection *URLConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, strong)NSMutableData *receivedData2;

@property(nonatomic, strong)NSDictionary *receiveDic;
@property(nonatomic, assign)id<LYTest2Request2Delegate> delegate;

- (void)sendLoginRequestWithDelegate:(id<LYTest2Request2Delegate>)delegate;

- (void)cancelRequest;

@end