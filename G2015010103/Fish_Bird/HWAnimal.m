//
//  HWFish.m
//  G2015010103_Homework
//
//  Created by 李凌霄 on 15/8/12.
//
//

#import "HWAnimal.h"

@implementation HWAnimal

#pragma mark - Lifecycle Methods

- (instancetype)init
{
	if ([super init]) {
		self.name = @"anAnimal";
		self.gender = HWAnimalGenderUndefined;
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"%@ has been hunted.", self.name);
}

#pragma mark - Custom Methods

- (void)cry
{
	NSLog(@"Biu biu biu…");
}

@end
