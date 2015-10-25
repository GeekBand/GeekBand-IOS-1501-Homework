//
//  GBMRegisterRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/18/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"


@class GBMRegisterRequest;

@protocol GBMRegisterRequestDelegate <NSObject>

- (void)registerRequestSuccess:(GBMRegisterRequest *)request user:(GBMUserModel *)user;
- (void)registerRequestFailed:(GBMRegisterRequest *)request error:(NSError *)error;

@end


@interface GBMRegisterRequest : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSURLConnection *urlConnection;
@property (nonatomic,strong) NSMutableData *receivcedData;
@property (nonatomic,strong) id <GBMRegisterRequestDelegate> delegate;

- (void)sendRegisterRequestWithUserName:(NSString *)userName
                                  email:(NSString *)email
                               password:(NSString *)password
                                   gbid:(NSString *)gbid
                               delegate:(id<GBMRegisterRequestDelegate>)delegate;

@end
