//
//  animal.m
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "animal.h"

@implementation animal

-(id)initWithName:(NSString *)name andSex:(animalSex)sex andWeight:(CGFloat)weight{
    
    if (self == [super init]){
        _name   = name;
        _weight = weight;
        _sex    = sex;
    }
    return self;
}
@end
