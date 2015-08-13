//
//  CCFish.h
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import "CCAnimal.h"

@interface CCFish : CCAnimal

@property(nonatomic,assign)Color color;

- (void)swim;

- (instancetype)initWithColor:(Color)color;

@end
