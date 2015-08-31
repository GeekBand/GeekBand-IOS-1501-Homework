//
//  CSAnimal.h
//  CSDemo01
//
//  Created by ZhangBob on 8/8/15.
//  Copyright (c) 2015 ZhangBob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSAnimal : NSObject
{
    
}

typedef enum{
    female,
    male
}animalGender;

@property(nonatomic ,copy)NSString *name;
@property(nonatomic,assign)NSInteger weight;
@property(nonatomic,assign)animalGender gender;


//+(void)creatAnimal;

-(instancetype)initWithName:(NSString *)name weight:(NSInteger )weight gender:(animalGender)gender;

-(void)animalVoice;


@end
