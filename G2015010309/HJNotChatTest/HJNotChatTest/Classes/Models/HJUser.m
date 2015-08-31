//
//  HJUser.m
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJUser.h"

@implementation HJUser

+ (HJUser *)uerWithID:(NSInteger)uerID name:(NSString *)aName headImage:(UIImage *)headImage {
    HJUser *user = [[HJUser alloc] init];
    user.userID = uerID;
    user.name = aName;
    user.headImage = headImage;
    return user;
}

@end
