//
//  CSBird.h
//  CSDemo01
//
//  Created by ZhangBob on 8/9/15.
//  Copyright (c) 2015 ZhangBob. All rights reserved.
//

#import "CSAnimal.h"
#import <UIKit/UIKit.h>

@interface CSBird : CSAnimal

@property(nonatomic,copy)UIColor *birdColor;

-(void) isBirdFly;

@end
