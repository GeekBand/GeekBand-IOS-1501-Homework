//
//  BZBird.m
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "BZBird.h"

@implementation BZBird

- (instancetype)initWithName:(NSString *)name gender:(BZGender)gender weight:(NSInteger)weight color:(UIColor *) color
{
    self = [super initWithName:name gender:gender weight:weight];
    if (self) {
        self.color = color;
    }
    return self;
}

-(void)startFlying
{
    NSLog(@"bird %@ is flying!", self.name);
}

-(void)stopFlying
{
    NSLog(@"bird %@ stops flying!", self.name);
}

@end
