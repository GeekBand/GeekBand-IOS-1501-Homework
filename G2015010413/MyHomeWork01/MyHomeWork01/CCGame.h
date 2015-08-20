//
//  Game.h
//  HomeWork01
//
//  Created by 张亚群 on 15/8/13.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCGame : NSObject

@property(nonatomic,weak)NSMutableArray *animals;

- (NSMutableArray *)play;

@end
