//
//  GBMSquareRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMSquareModel.h"
@class GBMSquareRequest;

@protocol GBMSquareRequestDelegate <NSObject>

- (void)squareRequestSuccess:(GBMSquareRequest *)request dictionary:(NSDictionary *)dictionary;
- (void)squareRequestSuccess:(GBMSquareRequest *)request squareModel:(GBMSquareModel *)squareModel;
- (void)squareRequestFailed:(GBMSquareRequest *)request error:(NSError *)error;

@end

@interface GBMSquareRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMSquareRequestDelegate> delegate;

- (void)sendSquareRequestWithParameter:(NSDictionary *)paramDic
                              delegate:(id <GBMSquareRequestDelegate>)delegate;



@end
