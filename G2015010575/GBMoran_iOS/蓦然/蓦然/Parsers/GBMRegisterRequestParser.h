//
//  GBMRegisterRequestParser.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"

@interface GBMRegisterRequestParser : NSObject

- (GBMUserModel *)parseJson:(NSData *)data;

@end
