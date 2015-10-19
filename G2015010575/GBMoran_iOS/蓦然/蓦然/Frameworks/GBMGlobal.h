//
//  GBGlobal.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//
#import "GBMUserModel.h"
#import <Foundation/Foundation.h>

@interface GBMGlobal : NSObject

@property(nonatomic, strong)GBMUserModel *user;

+ (GBMGlobal *)shareGloabl;

@end
