//
//  HJFavPaidAppRequest.h
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  HJFavPaidAppRequestDelegate<NSObject>

- (void)requestSuccess: (NSArray *)appArray;
- (void)setXmlParseTime:(double)time;
- (void)setJsonParseTime: (double)time;

@end

@interface HJFavPaidAppRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *URLConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) BOOL          isJson;

@property (nonatomic, assign) id<HJFavPaidAppRequestDelegate>delegate;

- (void)requestForPaidAppJson: (BOOL)isJson;
- (void)cancelRequest;

@end
