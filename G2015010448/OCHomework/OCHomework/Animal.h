//
//  Animal.h
//  OCHomework
//
//  Created by RayBoon on 2015/08/22.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {male, female} AnimalSex;

@interface Animal : NSObject


@property (nonatomic, copy) NSString * name; //名字

@property (nonatomic, assign) float weight; //重量

@property (nonatomic, assign) AnimalSex gender; //性别

- (instancetype) initWithName:(NSString *) name WithWeight: (float) weight WithGender:(AnimalSex) gender;

- (void) say; //动物发声

@end
