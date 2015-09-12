//
//  UIImage+Extension.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (instancetype)resizeImageWithName:(NSString *)imageName
{
    //    [backgroundImage resizableImageWithCapInsets:]平铺效果，被strechableImageWithLeftCapWidth：调用
    //    [backgroundImage resizableImageWithCapInsets:(UIEdgeInsets) resizingMode:(UIImageResizingMode)]拉伸图片
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:image.size.width / 2 topCapHeight:image.size.height / 2];
    return image;
}


@end
