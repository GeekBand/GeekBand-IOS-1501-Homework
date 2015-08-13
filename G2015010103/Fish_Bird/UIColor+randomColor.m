//
//  UIColor+randomColor.m
//  G2015010103_Homework
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import "UIColor+randomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor
{
	CGFloat randomRed = arc4random() % 255 / 255.0;
	CGFloat randomGreen = arc4random() % 255 / 255.0;
	CGFloat randomBlue = arc4random() % 255 / 255.0;
	CGFloat randomAlpha = arc4random() % 100 / 100.0;
	
	UIColor *aRandomColor = [[UIColor alloc] initWithRed:randomRed green:randomGreen blue:randomBlue alpha:randomAlpha];
//	NSLog(@"random color with R:%.2f G:%.2f B:%.2f alpha:%.2f.", randomRed, randomGreen, randomBlue, randomAlpha);
	return aRandomColor;
}

@end
