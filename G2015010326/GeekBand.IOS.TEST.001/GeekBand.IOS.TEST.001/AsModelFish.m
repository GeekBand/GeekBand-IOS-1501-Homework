//
//  AsModelFish.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "AsModelFish.h"
#import "UIColor+randomColor.h"

@implementation AsModelFish

- (void)swimming
{
    NSLog(@"[%@]: Swimming!", self.name);
}


- (instancetype)initWith:(NSString *)name gender:(ASAnimalGender)gender weight:(float)weight
{
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"Fish[%@]", name];
        self.gender = gender;
        self.weight = weight;
        self.color = [UIColor randomColor];
    }
    return self;
}

- (void)sounding
{
    NSLog(@"[%@]: Sounding!", self.name);
}
@end
