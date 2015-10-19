//
//  GWUser.m
//  Mo Ran
//
//  Created by Will Ge on 9/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWUser.h"

@implementation GWUser

static GWUser *userInfo;

+(id)allocWithZone:(struct _NSZone *)zone
{
  static GWUser *userInfo;
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    userInfo = [super allocWithZone:zone];
  });
  
  return userInfo;
}

+(instancetype)shareUser
{
  if (!userInfo) {
    userInfo = [[GWUser alloc] init];
  }
  return userInfo;
}

@end
