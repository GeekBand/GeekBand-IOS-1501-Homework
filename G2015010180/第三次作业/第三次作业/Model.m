
//
//  Model.m
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "Model.h"

@implementation Model

-(void)encodeWithCoder:(nonnull NSCoder *)aCoder
{
    [aCoder encodeObject:_image forKey:@"image"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_word forKey:@"word"];
}

-(instancetype)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _image = [aDecoder decodeObjectForKey:@"image"];
        _name = [aDecoder decodeObjectForKey:@"name"];
        _word = [aDecoder decodeObjectForKey:@"word"];
    }
    return self;
}

@end
