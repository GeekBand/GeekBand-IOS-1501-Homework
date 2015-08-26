//
//  IDFish.h
//  IDHomework
//
//  Created by int2d on 15/8/14.
//  Copyright (c) 2015年 int2d. All rights reserved.
//

#import "IDAnimal.h"
#import <UIKit/UIKit.h>

@interface IDFish : IDAnimal

@property (nonatomic, strong) UIColor* color;

- (id)initWithName:(NSString *)name sex:(IDSex)sex weight:(float)weight color:(UIColor *)color;

- (void)swim;

@end
