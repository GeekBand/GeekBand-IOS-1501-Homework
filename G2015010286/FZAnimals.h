//
//  FZAnimals.h
//  Hunt
//
//  Created by Flame on 15/8/8.
//  Copyright © 2015年 Flame. All rights reserved.
//

typedef enum {
    male,female
} Sex;


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FZAnimals : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) Sex sex;

+ (instancetype)initWithName:(NSString *)name andWeight:(float)weight andSex:(Sex)sex;
- (void)animalSound;

@end
