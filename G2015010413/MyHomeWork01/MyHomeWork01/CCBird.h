//
//  CCBird.h
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import "CCAnimal.h"
#import <UIKit/UIKit.h>


@interface CCBird : CCAnimal

@property(nonatomic,assign)Color color;

- (void)fly;

- (instancetype)initWithColor:(Color)color;

@end
