//
//  TBird.h
//  test0808
//
//  Created by snddfhv on 15/8/10.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "TAnimal.h"

@interface TBird : TAnimal

@property(nonatomic, assign)TAnimalColor color; // 颜色

// 小鸟的构造方法
- (TBird *)initWithName:(NSString *)name andGender:(TAnimalGender)gender andWeight:(float)weight andColor:(TAnimalColor)color;

// 小鸟会飞
- (void)fly;

@end
