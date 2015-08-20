//
//  AsModelBird.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "AsModelBird.h"
#import "UIColor+randomColor.h"

@implementation AsModelBird


- (void)flying
{
    NSLog(@"[%@]: Flying!", self.name);
}

- (void)sounding
{
    NSLog(@"[%@]: Sounding!", self.name);
}

- (instancetype)initWith:(NSString *)name gender:(ASAnimalGender)gender weight:(float)weight
{
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"Bird[%@]", name];
        self.gender = gender;
        self.weight = weight;
        self.color = [UIColor randomColor];
    }
    return self;
}
@end
