//
//  IZBird.m
//  GeekBandHomeWorkOC01
//
//  Created by Liang Zisheng on 9/5/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import "IZBird.h"

@implementation IZBird

- (instancetype)initWithInfoDictionary:(NSDictionary *)infoDictionary {
    if (self = [super initWithInfoDictionary:infoDictionary]) {
        _color = [infoDictionary valueForKey:@"Color"];
    }
    return self;
}

- (void)flying {
    NSLog(@"Bird:%@ is flying", self.name);
}

@end
