//
//  GBMLoginRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"

@class GBMLoginRequest;

@protocol GBMLoginRequestDelegate <NSObject>

- (void)loginRequestSuccess:(GBMLoginRequest *)request user:(GBMUserModel *)user;
- (void)loginRequestFailed:(GBMLoginRequest *)request error:(NSError *)error;

@end

@interface GBMLoginRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSURLConnection *urlConnection;
@property (nonatomic,strong) NSMutableData *receivedData;
@property (nonatomic,assign) id <GBMLoginRequestDelegate> delegate;

- (void)sendLoginRequestWithEmail:(NSString *)email
                         password:(NSString *)password
                             gbid:(NSString *)gbid
                         delegate:(id <GBMLoginRequestDelegate>)delegate;

@end
