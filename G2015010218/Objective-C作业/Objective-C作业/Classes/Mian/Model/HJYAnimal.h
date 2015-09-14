//
//  HJYAnimal.h
//  Objective-C作业
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//  动物

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, HJYAnimalGenderType) {
    HJYAnimalGenderTypeMale,    // 雄性
    HJYAnimalGenderTypeFemale,  // 雌性
    HJYAnimalGenderTypeUnknown, // 未知
};


@interface HJYAnimal : NSObject
/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 性别 */
@property (nonatomic, assign) HJYAnimalGenderType genderType;
/** 体重 */
@property (nonatomic, assign) double weight;

/** 发声 */
- (void) phonation;

@end
