//
// Created by zzdjk6（陈圣晗） on 15/8/9.
// Copyright (c) 2015 zzdjk6（陈圣晗）. All rights reserved.
//

#import "BLFish.h"

@implementation BLFish
{

}

#pragma mark - Override

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor clearColor];
    }

    return self;
}

+ (float)weightUpperBound
{
    return 10.0f;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.color=%@", self.color];

    NSMutableString *superDescription = [[super description] mutableCopy];
    NSUInteger      length            = [superDescription length];

    if (length > 0 && [superDescription characterAtIndex:length - 1] == '>') {
        [superDescription insertString:@", " atIndex:length - 1];
        [superDescription insertString:description atIndex:length + 1];
        return superDescription;
    }
    else {
        return [NSString stringWithFormat:@"<%@: %@>", NSStringFromClass([self class]), description];
    }
}

#pragma mark - Custom

- (void)swim
{
    NSLog(@"Swim as a Fish: %@.", self);
}

@end