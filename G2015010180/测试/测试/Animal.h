//
//  Animal.h
//  测试
//
//  Created by 陈铭嘉 on 15/8/8.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    male,
    female
}sex;

@interface Animal : NSObject

@property (nonatomic, assign)sex sex;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)NSUInteger weight;

-(instancetype)initWithName:(NSString *)name WithWeight:(NSUInteger)weight WithSex:(sex)sex;
-(void)MakeVoice;

@end
