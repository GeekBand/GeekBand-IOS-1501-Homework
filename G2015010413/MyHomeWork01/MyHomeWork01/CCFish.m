//
//  CCFish.m
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import "CCFish.h"

@implementation CCFish


-(void)swim
{
    NSLog(@"%i fish is swimming",self.color);
}


//指定初始化方法
-(instancetype)initWithColor:(Color)color
{
    self = [super init];
    
    if (self) {
        
        self.color = color;
    }
    
    return self;
}
//覆盖父类默认方法
- (instancetype)init
{
    return [self initWithColor:Black];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%i 's fish",self.color];
}
@end
