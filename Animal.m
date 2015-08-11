
//  Animal.m
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import "Animal.h"

@implementation Animal
+(void)sayState{
    NSLog(@"我是一只动物");
}
-(instancetype)initWithName:(NSString *)name Weight:(NSInteger)weight Sex:(AnimalSexType)sex{
    self=[super init];
    if (self) {
        _name=name;
        _weight=weight;
        _sex=sex;
    }
    return self;
}
-(void)sayMy{
    if (_sex==male) {
        NSLog(@"我叫%@，现在%li，是男的",_name,(long)_weight);

    }
    else if(_sex==female )
    {
        NSLog(@"我叫%@，现在%li，是女的",_name,(long)_weight);

    }
   }
@end
