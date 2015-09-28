//
//  Model.h
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject<NSCoding>

@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSString *word;
@property (nonatomic,strong) NSString *name;

@end
