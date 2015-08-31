//
//  Bird.h
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "Animal.h"

@interface Bird : Animal
@property(nonatomic,copy)UIColor *color;
-(void)fly;
-(id)initWithName:(NSString *)name weight:(CGFloat)weight sex:(SEX)sex color:(UIColor *)color;
@end
