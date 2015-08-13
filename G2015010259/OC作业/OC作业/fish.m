//
//  fish.m
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "fish.h"

@implementation fish

-(id)initWithName:(NSString *)name andSex:(animalSex)sex andWeight:(CGFloat)weight andColor:(NSString *)color{
    
    if (self == [super initWithName:name andSex:sex andWeight:weight]){
        _fishColor  = color;
    }
    return self;
}

- (void)fishSwimming{
    
    NSLog(@"名字为%@的鱼儿游泳..." , self.name);
}

//- (NSString *)description{
//    return [NSString stringWithFormat:@"name is %@ , sex is %d weight is %.2f color is %@" , self.name , self.sex , self.weight , self.fishColor];
//}
@end
