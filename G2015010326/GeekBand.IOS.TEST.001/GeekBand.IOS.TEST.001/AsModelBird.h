//
//  AsModelBird.h
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "AsModelAnimalBase.h"
#import <UIKit/UIKit.h>

@interface AsModelBird : AsModelAnimalBase

@property (nonatomic, strong) UIColor * color;

- (void)flying;
- (instancetype)initWith:(NSString *)name gender:(ASAnimalGender)sex weight:(float)weight;
@end
