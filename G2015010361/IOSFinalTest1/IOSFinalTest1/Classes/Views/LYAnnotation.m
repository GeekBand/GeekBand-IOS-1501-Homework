//
//  LYAnnotation.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYAnnotation.h"

@implementation LYAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                   title:(NSString *)title
                subtitle:(NSString *)subtitle
                   index:(NSInteger)index
{
    self = [super init];
    if (self) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.index = index;
    }
    return self;
}

@end
