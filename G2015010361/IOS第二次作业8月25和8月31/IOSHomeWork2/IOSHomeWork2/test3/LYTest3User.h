//
//  LYTest3User.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYTest3User : NSObject{
    NSString         *_headImagePath;
}

@property (nonatomic, copy) NSString *headImagePath;

+ (LYTest3User *)headImagePath:(NSString *)aHeadImagePath;

@end


