//
//  BLAnimal.h
//  BLOCPractice
//
//  Created by zhu yongxuan on 15/8/9.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLAnimal : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *gender;
@property (nonatomic)NSInteger weight;



- (void)voise;

@end
