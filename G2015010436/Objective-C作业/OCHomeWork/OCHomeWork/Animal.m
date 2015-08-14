//
//  Animal.m
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(id)initWithName:(NSString *)name
           weight:(CGFloat)weight
              sex:(SEX)sex{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.tsex =sex;
    }
    return self;
}
-(void)showSound{
    NSLog(@"the animal name is%@ ,the weight is %lf ,the sex is %u",self.name,self.weight,self.tsex);
}
@end
