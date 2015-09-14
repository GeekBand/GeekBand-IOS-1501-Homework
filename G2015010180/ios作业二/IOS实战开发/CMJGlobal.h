//
//  CMJGlobal.h
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMJUser.h"

@interface CMJGlobal : NSObject

@property(nonatomic, strong)CMJUser *user;

+ (CMJGlobal *)shareGloabl;

@end
