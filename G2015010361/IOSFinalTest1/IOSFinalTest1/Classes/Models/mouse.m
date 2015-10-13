//
//  mouse.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/13.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "mouse.h"

@implementation mouse
+ (mouse *)mouseName:(NSString *)aName
          runawayNum:(NSString *)aRunawayNum{
    mouse *mouse1 = [[mouse alloc] init];
    mouse1.name = aName;
    mouse1.runawayNum = aRunawayNum;
    return mouse1;
    
}
@end
