//
//  BZFish.h
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BZAnimal.h"

@interface BZFish : BZAnimal

@property (nonatomic, strong) UIColor* color;

- (instancetype)initWithName:(NSString *)name gender:(BZGender)gender weight:(NSInteger)weight color:(UIColor *) color;
-(void) startSwimming;
-(void) stopSwimming;

@end
