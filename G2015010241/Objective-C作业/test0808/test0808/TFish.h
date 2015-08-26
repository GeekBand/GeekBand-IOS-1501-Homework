//
//  TFish.h
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TAnimal.h"

@interface TFish : TAnimal

@property(nonatomic, assign)TAnimalColor color; // 颜色

// 小鱼的构造方法
- (TFish *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight andColor:(TAnimalColor)color;

// 小鱼会游泳
- (void)swim;

@end
