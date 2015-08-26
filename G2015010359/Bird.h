//
//  Bird.h
//  Test01
//
//  Created by leeguoyu on 15/8/9.
//  Copyright (c) 2015年 Guoyu. All rights reserved.
//

#import "Animal.h"

typedef enum{
    whiteColor = 0,
    blueColor,
    blackColor,
    redColor,
    greenColor,
    
}BirdColor;

@interface Bird : Animal

//因为不知道用uicolor来做颜色的话，如何打印出来，所以用文字简单模拟一下
@property (nonatomic, assign) BirdColor *birdColor;

- (void)fly;

@end
