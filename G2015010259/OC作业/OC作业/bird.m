//
//  bird.m
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "bird.h"

@implementation bird

- (id) initWithName:(NSString *)name andSex:(animalSex)sex andWeight:(CGFloat)weight andColor:(NSString *)color{
    
    if (self == [super initWithName:name andSex:sex andWeight:weight]){
        
        self.bridColor  = color;
    }
    return self;
}

-(void)birdFly{
    NSLog(@"%@颜色的鸟儿%@飞..." ,self.bridColor , self.name);
}

@end
