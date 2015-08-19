//
//  Fish.h
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import "Animal.h"

@interface Fish : Animal
@property (nonatomic,copy) NSString* color;
+(void)swim;
+(NSInteger)hunt;
@end
