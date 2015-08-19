//
//  Animal.m
//  Test01
//
//  Created by leeguoyu on 15/8/9.
//  Copyright (c) 2015年 Guoyu. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void)speak{
    
    if (_gender == Male) {
        NSLog(@"我叫%@，男的，重%.1f斤", _name, _weight);
    }else{
        NSLog(@"我叫%@，女的，重%.1f斤你不要告诉别人", _name, _weight);
    }
}

@end
