//
//  mouse.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/13.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface mouse : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *runawayNum;
+ (mouse *)mouseName:(NSString *)aName
     runawayNum:(NSString *)aRunawayNum;

@end
