//
//  LYTest2Request.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LYTest2Request;

@protocol LYTest2RequestDelegate <NSObject>
@optional
- (void)requestSuccess:(LYTest2Request *)request;
- (void)requestFailed:(LYTest2Request *)request error:(NSError *)error;

@end

@interface LYTest2Request : NSObject<NSURLConnectionDataDelegate>

@property(nonatomic, strong)NSURLConnection *URLConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, strong)NSMutableData *receivedData2;

@property(nonatomic, strong)NSDictionary *receiveDic;
@property(nonatomic, assign)id<LYTest2RequestDelegate> delegate;

- (void)sendLoginRequestWithDelegate:(id<LYTest2RequestDelegate>)delegate;

- (void)cancelRequest;

@end
