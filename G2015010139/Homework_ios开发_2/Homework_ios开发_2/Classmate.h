//
//  Classmate.h
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Classmate : NSObject < NSCoding >

@property (nonatomic, strong) UIImage * image;

@property (nonatomic, copy) NSString * name;

@property (nonatomic, copy) NSString * content;

+ (NSArray *)keysForCoding;

- (instancetype)initWithImage:(UIImage *)image Name:(NSString *)name Content:(NSString *)content;

@end
