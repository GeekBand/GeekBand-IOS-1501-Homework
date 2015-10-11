//
//  LYGetWBUserInfo.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class LYGetWBUserInfo;

@protocol LYGetWBUserInfoDelegate <NSObject>

//- (void)requestSuccess:(LYGetWBUserInfo *)request user:(BLUser *)usr;
- (void)requestFailed:(LYGetWBUserInfo *)request error:(NSError *)error;

@end

@interface LYGetWBUserInfo : NSObject

@property(nonatomic, strong)NSURLConnection *URLConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, assign)id<LYGetWBUserInfoDelegate> delegate;

- (void)sendLoginRequestWithUserName:(NSString *)userName
                            delegate:(id<LYGetWBUserInfoDelegate>)delegate;

- (void)cancelRequest;

@end
