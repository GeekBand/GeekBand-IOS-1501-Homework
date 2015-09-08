//
//  BLFish.m
//  
//
//  Created by 祝海焜 on 15/9/5.
//
//

#import "BLFish.h"

@implementation BLFish

-(id)initWithName:(NSString *)name weight:(NSInteger)weight sex:(SEX)sex color:(UIColor *)color
{
    self =[super initWithName:name weight:weight sex:sex];
    if (self) {
        self.color = color;
    }
    return  self;
}

- (void)swim
{
    NSLog(@"%@在游",self.name);
}

@end
