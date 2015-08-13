//
//  Animal.h
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    male,
    female
} AnimalSexType;

@interface Animal : NSObject
@property (nonatomic,copy) NSString* name;
@property(nonatomic,assign)NSInteger weight;
@property(nonatomic,assign)AnimalSexType sex;

+(void)sayState;
-(instancetype)initWithName:(NSString*)name Weight:(NSInteger)weight Sex:(AnimalSexType)sex;
-(void)sayMy;
@end

