//
//  GWUser.h
//  Mo Ran
//
//  Created by Will Ge on 9/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWUser : NSObject

@property (nonatomic, copy   ) NSString *email;
@property (nonatomic, copy   ) NSString *userID;
@property (nonatomic, assign ) BOOL     isLogin;
@property (nonatomic, copy   ) NSString *userName;
@property (nonatomic, copy   ) NSString *token;
@property (nonatomic, copy   ) NSString *avatar;
@property (nonatomic, copy   ) NSString *lastLogin;
@property (nonatomic, copy   ) NSString *logintimes;
@property (nonatomic, copy   ) NSString *projectID;


+(instancetype)shareUser;

@end
