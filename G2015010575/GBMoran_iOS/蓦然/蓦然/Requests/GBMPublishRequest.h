//
//  GBMPublishRequest.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//


#import <Foundation/Foundation.h>
@class GBMPublishRequest;


@protocol GBMPublishRequestDelegate <NSObject>

- (void)requestSuccess:(GBMPublishRequest *)request picId:(NSString *)picId;
- (void)requestFailed:(GBMPublishRequest *)request error:(NSError *)error;

@end

@interface GBMPublishRequest : NSObject

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property(nonatomic, assign)id<GBMPublishRequestDelegate> delegate;

- (void)sendLoginRequestWithUserId:(NSString *)userId
                             token:(NSString *)token
                         longitude:(NSString *)longitude
                          latitude:(NSString *)latitude
                             title:(NSString *)title
                              data:(NSData *)data
                          delegate:(id<GBMPublishRequestDelegate>)delegate;

@end
