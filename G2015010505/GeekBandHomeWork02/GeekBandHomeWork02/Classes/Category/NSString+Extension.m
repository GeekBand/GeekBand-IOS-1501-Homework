//
//  NSString+Extension.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
                              context:nil].size;
}

@end
