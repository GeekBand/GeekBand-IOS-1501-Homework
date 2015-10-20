//
//  GBMLoginRequestParser.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"

// 这个类的作用是把JSON数据转换成model
@interface GBMLoginRequestParser : NSObject

-(GBMUserModel *)parseJson:(NSData *)data;

@end
