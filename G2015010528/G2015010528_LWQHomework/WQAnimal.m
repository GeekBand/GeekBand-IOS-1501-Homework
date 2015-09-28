//
//  WQAnimal.m
//  G2015010528_LWQHomework
//
//  Created by Andrew on 15/8/13.
//  Copyright (c) 2015年 andrew. All rights reserved.
//

#import "WQAnimal.h"

@implementation WQAnimal

- (id) initWithName:(NSString *)name andWeight:(double)weight andSex:(Sex)sex
{
    if(self=[super init])
    {
        _name=name;
        _weight=weight;
        _sex=sex;
    }
    
    return self;
}

- (void)sayMyInfo
{
    NSLog(@"this is an animal");
}

@end
