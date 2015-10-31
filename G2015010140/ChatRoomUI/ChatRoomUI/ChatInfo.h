//
//  ChatInfo.h
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"

@interface ChatInfo : NSObject

@property(strong, nonatomic, nonnull)User    *user;
@property(assign, nonatomic)BOOL             isSelf;
@property(copy, nonatomic, nonnull)NSString  *content;

- (__nullable id)initWithUser:(User * __nonnull )user
                isSelf:(BOOL)isSelf
               content:( NSString * __nonnull )content;

@end
