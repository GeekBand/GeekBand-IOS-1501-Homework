//
//  Animal.h
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject

typedef enum{
    male,female
}sexual;



@property (nonatomic) sexual sex;
@property (strong,nonatomic) NSString *name;
@property (nonatomic) CGFloat weight;


-(void)say;
-(instancetype)initWithName:(NSString *)aName
                     Sexual:(sexual)aSex
                     Weight:(CGFloat)aWeight;

-(void)animalDo:(id)aAnimal;

+(void)createAnimal:(NSMutableArray *)aliveArray;
+(void)catchAnimal:(NSMutableArray *)catchArray;

@end
