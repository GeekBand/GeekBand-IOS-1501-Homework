//
//  LAnnotation.m
//  Xcode_learn
//
//  Created by house on 15/8/6.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "LAnnotation.h"

@implementation LAnnotation
-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
                  title:(NSString *)title
               subtitle:(NSString *)subtitle
                  index:(NSInteger)index{
    self= [super init];
    if (self) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.index = index;
    }
    return self;

}
@end
