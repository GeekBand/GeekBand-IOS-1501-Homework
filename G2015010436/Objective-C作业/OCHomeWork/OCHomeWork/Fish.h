//
//  Fish.h
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "Animal.h"

@interface Fish : Animal
@property(nonatomic,copy)UIColor *color;
-(void)swim;
-(id)initWithName:(NSString *)name weight:(CGFloat)weight sex:(SEX)sex color:(UIColor *)color;

@end
