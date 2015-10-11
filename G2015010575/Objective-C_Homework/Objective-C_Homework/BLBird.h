//
//  BLBird.h
//  Objective-C_Homework
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import "BLAnimal.h"
#import <UIKit/UIKit.h>

@interface BLBird : BLAnimal

@property(nonatomic, strong)UIColor *color;

-(id)initWithName:(NSString *)name weight:(NSInteger)weight sex:(SEX)sex color:(UIColor *)color;

- (void)fly;

@end
