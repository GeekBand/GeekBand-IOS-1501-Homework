//
//  UIColor+Hex.m
//  GKMoranHouse
//
//  Created by house on 15/8/19.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+(UIColor *)colorWithHexString:(NSString *)color{
    return  [self colorWithHexString:color alpha:1.0];
}

+(UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
// delete space
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]uppercaseString];
   
 // string must be 6 to 8 length
    if (cString.length<6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];

    }
    if (cString.length!=6) {
        return [UIColor clearColor];
    }

//     Separate into r, g, b substrings
    NSRange  range;
    range.length=2;
    range.location=0;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range ];
    // Scan values
    unsigned int r, g, b;
  
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    
    return  [UIColor colorWithRed:((float)r/255.0f)
                            green:((float)g/255.0f)
                             blue:((float)b/255.0f)
                            alpha:alpha];
}
@end
