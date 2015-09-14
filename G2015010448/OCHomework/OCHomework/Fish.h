//
//  Fish.h
//  OCHomework
//
//  Created by RayBoon on 2015/08/23.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import "Animal.h"

@interface Fish : Animal

@property (nonatomic, copy) NSString * color;

- (instancetype) initWithName:(NSString *)name WithWeight:(float)weight WithGender:(AnimalSex)gender WithColor: (NSString *) color;

- (void) swimming;

@end
