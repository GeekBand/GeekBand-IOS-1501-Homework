//
//  TAnimal.h
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义动物的性别
typedef enum {
    TAnimalGenderFemale = 0,
    TAnimalGenderMale
} TAnimalGender;

// 定义动物的颜色
typedef enum {
    TAnimalColorRed = 0,
    TAnimalColorGreen
} TAnimalColor;

@interface TAnimal : NSObject

@property(nonatomic, assign)TAnimalGender gender; // 性别
@property(nonatomic, strong)NSString *name; // 名字
@property(nonatomic, assign)float weight; // 体重

// 动物构造方法
- (TAnimal *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight;

// 动物发出叫声
- (void)yelp;

@end
