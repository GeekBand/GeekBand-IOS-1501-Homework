//
//  WQAnimal.h
//  G2015010528_LWQHomework
//
//  Created by Andrew on 15/8/13.
//  Copyright (c) 2015年 andrew. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    LWQMale,
    LWQFemale
}Sex;

@interface WQAnimal : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) double weight;
@property (nonatomic,assign) Sex sex;

- (id) initWithName:(NSString *)name andWeight:(double)weight andSex:(Sex)sex;

- (void)sayMyInfo;

@end
