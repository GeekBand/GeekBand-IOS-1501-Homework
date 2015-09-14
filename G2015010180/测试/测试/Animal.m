//
//  Animal.m
//  测试
//
//  Created by 陈铭嘉 on 15/8/8.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "Animal.h"



@implementation Animal

-(instancetype)initWithName:(NSString *)name WithWeight:(NSUInteger)weight WithSex:(sex )sex
{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.sex = sex;
    }
    return self;
}

-(instancetype)init{
    self = [self initWithName:@"无" WithWeight:0 WithSex:0];
    return self;
}


-(void)MakeVoice{
    
    NSLog(@"My Name is %@,My weight is %ldl, My sex is %u",_name,(long)_weight,_sex);
}


@end
