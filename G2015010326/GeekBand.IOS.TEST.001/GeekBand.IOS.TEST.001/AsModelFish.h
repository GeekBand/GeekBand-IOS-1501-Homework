//
//  AsModelFish.h
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "AsModelAnimalBase.h"
#import <UIKit/UIKit.h>

@interface AsModelFish : AsModelAnimalBase
@property (nonatomic, strong) UIColor * color;

- (void)swimming;
- (instancetype)initWith:(NSString*)name gender:(ASAnimalGender)gender weight:(float)weight;
@end
