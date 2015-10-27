//
//  GBMGlobal.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"


@interface GBMGlobal : NSObject

@property (nonatomic,strong)GBMUserModel *user;

+ (GBMGlobal *)shareGlobal;

@end
