//
//  TBird.m
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TBird.h"

@implementation TBird

- (TBird *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight andColor:(TAnimalColor)color {
    self = [super initWithName:name andGender:gender andWeight:weight];
    if (self) {
        [self setColor:color];
    }
    return self;
}

- (void)fly {
    NSLog(@"我是%@，我在天空中自由翱翔...", [self name]);
}

@end
