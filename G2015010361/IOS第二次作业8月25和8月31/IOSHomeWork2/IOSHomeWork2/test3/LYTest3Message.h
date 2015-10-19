//
//  LYTest3Message.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LYTest3User.h"


@interface LYTest3Message : NSObject

@property (nonatomic, retain) LYTest3User *sender;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;

+ (LYTest3Message *)messageWithphoto:(LYTest3User *)aSender text:(NSString *)aText name:(NSString *) aName;


@end
