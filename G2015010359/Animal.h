//
//  Animal.h
//  Test01
//
//  Created by leeguoyu on 15/8/9.
//  Copyright (c) 2015年 Guoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    Male = 0,
    Female = 1,
}Gender;

@interface Animal : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat weight;
@property (nonatomic, assign) Gender gender;

- (void)speak;

@end
