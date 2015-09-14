//
//  UIColor+randomColor.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "UIColor+randomColor.h"

@implementation UIColor (randomColor)
+ (UIColor*) randomColor
{
    return [UIColor colorWithRed:arc4random() % 255
                           green:arc4random() % 255
                            blue:arc4random() % 255
                           alpha:1.0];
}
@end
