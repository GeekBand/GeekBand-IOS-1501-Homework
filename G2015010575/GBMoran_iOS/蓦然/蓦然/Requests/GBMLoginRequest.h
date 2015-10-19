//
//  GBMLoginRequest.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import "GBMUserModel.h"

@class GBMLoginRequest;

@protocol GBMLoginRequestDelegate <NSObject>

- (void)loginRequestSuccess:(GBMLoginRequest *)request user:(GBMUserModel *)user;
- (void)loginrequestFailed:(GBMLoginRequest *)request error:(NSError *)error;

@end

@interface GBMLoginRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMLoginRequestDelegate> delegate;

- (void)sendLoginRequestWithEmail:(NSString *)email
                         password:(NSString *)password
                             gbid:(NSString *)gbid
                         delegate:(id <GBMLoginRequestDelegate>)delegate;

@end
