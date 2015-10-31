//
//  ChatInfo.m
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "ChatInfo.h"

@implementation ChatInfo

- (id __nullable)initWithUser:(User * __nonnull)user isSelf:(BOOL)isSelf content:(NSString * __nonnull)content {
    self = [super init];
    if (self) {
        _user = user;
        _isSelf = isSelf;
        _content = content;
    }
    return self;
}

@end
