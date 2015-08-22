//
//  IDFish.m
//  IDHomework
//
//  Created by int2d on 15/8/14.
//  Copyright (c) 2015年 int2d. All rights reserved.
//

#import "IDFish.h"

@implementation IDFish

- (id)initWithName:(NSString *)name sex:(IDSex)sex weight:(float)weight color:(UIColor *)color {
    self = [super initWithName:name sex:sex weight:weight];
    if (self) {
        _color = color;
    }
    
    return self;
}

- (void)swim {
    
    NSLog(@"%@鱼游泳", self.name);
    
}

@end
