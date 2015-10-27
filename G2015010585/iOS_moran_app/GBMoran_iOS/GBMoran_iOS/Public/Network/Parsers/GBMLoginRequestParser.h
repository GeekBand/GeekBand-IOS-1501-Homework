//
//  GBMLoginRequestParser.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"
@interface GBMLoginRequestParser : NSObject

- (GBMUserModel *)parseJson:(NSData *)data;

@end
