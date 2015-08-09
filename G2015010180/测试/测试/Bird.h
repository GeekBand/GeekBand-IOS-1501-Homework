//
//  Bird.h
//  测试
//
//  Created by 陈铭嘉 on 15/8/8.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "Animal.h"

@interface Bird : Animal

@property(nonatomic,copy)NSString *color;


-(instancetype)initWithName:(NSString *)name WithWeight:(NSUInteger)weight WithSex:(sex )sex WithColor:(NSString*)color;

-(void)Fly;

@end
