//
//  BZAnimal.h
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BZAnimal : NSObject

typedef enum {
    male, female
} BZGender;

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign, readonly) BZGender gender;
@property (nonatomic, assign) NSInteger weight;

-(instancetype)initWithName:(NSString *)name gender:(BZGender)gender weight:(NSInteger) weight;
- (void) speak:(NSString *) content;

@end
