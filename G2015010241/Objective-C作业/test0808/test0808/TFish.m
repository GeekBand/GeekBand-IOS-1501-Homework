//
//  TFish.m
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TFish.h"

@implementation TFish

- (TFish *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight andColor:(TAnimalColor)color {
    self = [super initWithName:name andGender:gender andWeight:weight];
    if (self) {
        [self setColor:color];
    }
    return self;
}

- (void)swim {
    NSLog(@"我是%@，我在水中游来游去...", [self name]);
}

#pragma mark - TAnimal methods

- (void)yelp {
    NSLog(@"小鱼只会吐泡泡");
}

@end
