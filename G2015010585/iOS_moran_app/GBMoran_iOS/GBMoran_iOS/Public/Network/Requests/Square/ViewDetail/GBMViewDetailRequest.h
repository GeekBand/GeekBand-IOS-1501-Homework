//
//  GBMViewDetailRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GBMViewDetailRequest;

@protocol GBMViewDetailRequestDelegate <NSObject>

- (void)viewDetailRequestSuccess:(GBMViewDetailRequest *)request data:(NSArray *)array;

- (void)viewDetailRequestFailed:(GBMViewDetailRequest *)request error:(NSError *)error;

@end

@interface GBMViewDetailRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMViewDetailRequestDelegate> delegate;

- (void)sendViewDetailRequestWithParameter:(NSDictionary *)paramDic
                                  delegate:(id <GBMViewDetailRequestDelegate>)delegate;




@end
