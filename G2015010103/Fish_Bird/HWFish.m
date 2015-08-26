//
//  HWFish.m
//  G2015010103_Homework
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import "HWFish.h"
#import "UIColor+randomColor.h"

@implementation HWFish

#pragma mark - Lifecycle Methods

- (instancetype)init
{
	if ([super init]) {
		self.name = @"fish";
	}
	return self;
}

- (void)setWeight:(double)weight
{
	(weight > 0 && weight < 1000) ?
	(super.weight = weight) :
	NSLog(@"Invalid input.");
}

#pragma mark - Custom Methods

- (void)swim
{
	NSLog(@"%@ is swimming.", self.name);
}

- (void)cry
{
	NSLog(@"%@ cannot cry.", self.name);
}

@end
