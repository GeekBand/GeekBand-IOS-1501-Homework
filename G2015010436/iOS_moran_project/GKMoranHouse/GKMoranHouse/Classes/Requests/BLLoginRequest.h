//
//  BLLoginRequest.h
//  Xcode_learn
//
//  Created by house on 15/8/14.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUser.h"
@class BLLoginRequest;
@protocol BLLoginRequestDelegate <NSObject>
-(void)loginRequestSuccess:(BLLoginRequest *)request
                    user:(LUser *) user;
-(void)loginRequestError:(BLLoginRequest *) request
                   error:(NSError *)error;

@end
@interface BLLoginRequest : NSObject 

@property(nonatomic,strong)NSURLConnection *connection;
@property(nonatomic,strong)NSMutableData *receiveData;
@property(nonatomic,assign)id<BLLoginRequestDelegate>delegate;
-(void)sendLoginRequestWithUserName:(NSString *)userName
                           password:(NSString*)password
                           delegate:(id<BLLoginRequestDelegate>)delegate;
-(void)cancelRequest;
@end
