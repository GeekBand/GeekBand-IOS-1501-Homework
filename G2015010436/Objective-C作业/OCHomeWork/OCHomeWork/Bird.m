//
//  Bird.m
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "Bird.h"

@implementation Bird
-(id)initWithName:(NSString *)name weight:(CGFloat)weight sex:(SEX)sex color:(UIColor *)color{
    self =[super initWithName:name weight:weight sex:sex];
    if (self) {
        self.color = color;
    }
    return  self;
}
-(void)fly{
    NSLog(@"now bird the name is %@ in the fly state",self.name);
}
@end
