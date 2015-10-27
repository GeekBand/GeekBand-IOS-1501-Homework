//
//  GBMReImageRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class GBMReImageRequest;

@protocol GBMReImageRequestDelegate <NSObject>

- (void)reImageRequestSuccess:(GBMReImageRequest *)request;
- (void)reImageRequestFail:(GBMReImageRequest *)request error:(NSError *)error;

@end

@interface GBMReImageRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMReImageRequestDelegate> delegate;

- (void)sendReNameRequestWithImage:(UIImage *)image
                          delegate:(id <GBMReImageRequestDelegate>)delegate;

@end
