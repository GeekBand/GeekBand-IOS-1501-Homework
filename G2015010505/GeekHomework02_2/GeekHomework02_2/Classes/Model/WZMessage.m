//
//  WZMessage.m
//  GeekHomework02_2
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZMessage.h"

@implementation WZMessage

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.other forKey:@"other"];
    [aCoder encodeObject:self.photoUrl forKey:@"photo"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        if (!aDecoder) {
            return nil;
        }
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.other = [aDecoder decodeObjectForKey:@"other"];
        self.photoUrl = [aDecoder decodeObjectForKey:@"photo"];
    }
    return self;
}

@end
