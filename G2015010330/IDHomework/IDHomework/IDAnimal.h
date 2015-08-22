//
//  IDAnimal.h
//  IDHomework
//
//  Created by int2d on 15/8/13.
//  Copyright (c) 2015年 int2d. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    man,
    woman,
    other
}IDSex;

@interface IDAnimal : NSObject

@property (nonatomic, assign) IDSex sex;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float weight;

- (id)initWithName:(NSString *)name sex:(IDSex)sex weight:(float)weight;

- (void)say;

@end
