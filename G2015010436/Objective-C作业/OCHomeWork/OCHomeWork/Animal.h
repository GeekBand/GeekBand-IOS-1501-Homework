//
//  Animal.h
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum  {MALE,FEMALE}SEX;
@interface Animal : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)CGFloat weight;
@property(nonatomic,assign)SEX tsex;
-(id)initWithName:(NSString *)name
            weight:(CGFloat)weight
               sex:(SEX)sex;

-(void)showSound;
@end
