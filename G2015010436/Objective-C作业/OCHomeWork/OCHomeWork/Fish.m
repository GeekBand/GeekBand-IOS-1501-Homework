//
//  Fish.m
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "Fish.h"

@implementation Fish

-(id)initWithName:(NSString *)name weight:(CGFloat)weight sex:(SEX)sex color:(UIColor *)color{
    self =[super initWithName:name weight:weight sex:sex];
    if (self) {
        self.color = color;
    }
    return  self;
}
-(void)swim{
    NSLog(@"now fish the name is %@is in the swim state",self.name);
}
@end
