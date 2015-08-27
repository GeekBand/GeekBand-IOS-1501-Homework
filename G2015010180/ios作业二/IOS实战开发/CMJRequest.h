//
//  CMJRequest.h
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMJUser.h"
#import "CMJRequestParser.h"
@class CMJRequest;

@protocol CMJRequestDelegate <NSObject>

- (void)requestSuccess:(CMJRequest *)request user:(CMJUser *)usr;
- (void)requestFailed:(CMJRequest *)request error:(NSError *)error;

@end


@interface CMJRequest : NSObject

@property(nonatomic, strong)NSURLConnection *URLConnection;
@property(nonatomic, strong)NSMutableData *receivedData;
@property(nonatomic, assign)id<CMJRequestDelegate> delegate;
@property(nonatomic, strong)CMJUser *user;

- (void)sendLoginRequestWithdelegate:(id<CMJRequestDelegate>)delegate;;


- (void)cancelRequest;


@end
