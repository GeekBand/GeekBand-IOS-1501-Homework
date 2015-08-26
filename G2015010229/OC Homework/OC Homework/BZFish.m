//
//  BZFish.m
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "BZFish.h"

@implementation BZFish

- (instancetype)initWithName:(NSString *)name gender:(BZGender)gender weight:(NSInteger)weight color:(UIColor *) color
{
    self = [super initWithName:name gender:gender weight:weight];
    if (self) {
        self.color = color;
    }
    return self;
}

-(void)startSwimming
{
    NSLog(@"Fish %@ is swimming!", self.name);
}

-(void)stopSwimming
{
    NSLog(@"Fish %@ stops swimming!", self.name);
}

@end
