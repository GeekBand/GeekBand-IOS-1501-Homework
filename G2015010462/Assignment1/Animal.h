//
//  Animal.h
//  Assignment1
//
//  Created by 杨立 on 15/8/10.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

typedef enum { male = 0, famale, notsure } Gender;
@property (nonatomic) Gender gender;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSUInteger weight;

-(void) voice;

@end
