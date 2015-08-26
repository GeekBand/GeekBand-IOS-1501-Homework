//
//  HWBird.m
//  G2015010103_Homework
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import "HWBird.h"
#import "UIColor+randomColor.h"

@implementation HWBird

#pragma mark - Lifecycle Methods

- (instancetype)init
{
	if ([super init]) {
		self.name = @"bird";
	}
	return self;
}

#pragma mark - Custom Methods

- (void)fly
{
	NSLog(@"%@ is flying.", self.name);
}

- (void)cry
{
	NSLog(@"%@ is singing.", self.name);
}

@end
