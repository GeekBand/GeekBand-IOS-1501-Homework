//
//  LYTest1User.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest1User.h"

@implementation LYTest1User

@synthesize name            = _name;
@synthesize headImagePath   = _headImagePath;
@synthesize lifePhotoPath   = _lifePhotoPath;

+ (LYTest1User *)userWithName:(NSString *)aName
           headImagePath:(NSString *)aHeadImagePath
           lifePhotoPath:(NSString *)aLifePhotoPath {
    LYTest1User *user = [[LYTest1User alloc] init];
    user.name = aName;
    user.headImagePath = aHeadImagePath;
    user.lifePhotoPath = aLifePhotoPath;
    return user;
}

- (void)dealloc {
    self.name           = nil;
    self.headImagePath  = nil;
    self.lifePhotoPath  = nil;
}





@end



