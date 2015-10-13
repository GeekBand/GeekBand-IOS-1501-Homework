//
//  MyAccessTool.h
//  Homework_ios开发_2
//
//  Created by john on 15/9/30.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Classmate;

@interface MyAccessTool : NSObject

+ (void)saveClassmateArray;

+ (Classmate *)getClassmateAtIndex:(NSInteger)index;

+ (NSInteger)getClassmateNumber;

+ (void)saveClassmate:(Classmate *)classmate;

@end
