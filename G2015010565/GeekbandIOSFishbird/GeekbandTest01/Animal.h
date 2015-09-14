//
//  Animal.h
//  GeekbandTest01
//
//  Created by huzhigang on 15/8/8.
//  Copyright © 2015年 huzhigang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum gender
{
    male, female
} genderType;

@interface Animal : NSObject

@property(nonatomic,copy) NSString* name;
@property(nonatomic,assign) float weight;
@property(nonatomic,assign) genderType  gender;

-(void)makeVoice;

@end
