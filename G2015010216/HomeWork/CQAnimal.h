//
//  CQAnimal.h
//  HomeWork
//
//  Created by 陈强 on 15/8/13.
//  Copyright (c) 2015年 陈强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQAnimal : NSObject
@property enum sexy {male,famale};
@property (nonatomic,strong)NSNumber *nameNumber;
@property NSInteger weight;


-(void)animalVoice;



@end
