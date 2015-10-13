//
//  cat.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/13.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "cat.h"

@implementation cat
+ (cat *)catName:(NSString *)aName
     catHostName:(NSString *)aCatHostName{
    cat *cat1 = [[cat alloc] init];
    cat1.name = aName;
    cat1.hostName = aCatHostName;
    return cat1;
    
}


@end
