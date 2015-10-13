//
//  IZFish.m
//  GeekBandHomeWorkOC01
//
//  Created by Liang Zisheng on 9/5/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import "IZFish.h"

@implementation IZFish

- (instancetype)initWithInfoDictionary:(NSDictionary *)infoDictionary {
    if (self = [super initWithInfoDictionary:infoDictionary]) {
        _color = [infoDictionary valueForKey:@"Color"];
    }
    return self;
}

- (void)swimming {
    NSLog(@"Fish:%@ is swimming.", self.name);
}



@end
