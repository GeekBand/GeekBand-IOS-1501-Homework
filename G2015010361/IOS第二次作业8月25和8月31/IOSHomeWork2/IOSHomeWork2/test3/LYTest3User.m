//
//  LYTest3User.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest3User.h"

@implementation LYTest3User




@synthesize headImagePath   = _headImagePath;

+ (LYTest3User *)headImagePath:(NSString *)aHeadImagePath
{
    
    LYTest3User *user = [[LYTest3User alloc] init];
    user.headImagePath = aHeadImagePath;
    return user;
}

- (void)dealloc {
    self.headImagePath  = nil;
}

@end
