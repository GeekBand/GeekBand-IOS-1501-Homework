//
//  CCBird.m
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import "CCBird.h"

@implementation CCBird

-(void)fly
{
    NSLog(@"%i 's Bird,FLYING",self.color);
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

-(NSString *)description
{
    
    return  [NSString stringWithFormat:@"%i 's bird",self.color];
   
}
@end
