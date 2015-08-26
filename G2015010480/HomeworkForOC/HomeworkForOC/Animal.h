//
//  Animal.h
//  HomeworkForOC
//
//  Created by 孙志伟 on 15/8/10.
//  Copyright (c) 2015年 孙志伟. All rights reserved.
//

#import <Foundation/Foundation.h>

// 性别
typedef enum Gender : NSInteger {
    Male,
    Female
} Gender;

@interface Animal : NSObject


@property (nonatomic) NSInteger tag;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *weight;

- (void)speak;





@end
