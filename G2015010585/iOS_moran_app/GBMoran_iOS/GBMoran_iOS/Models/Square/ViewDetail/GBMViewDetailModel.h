//
//  GBMViewDetailModel.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBMViewDetailModel : NSObject

@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *modified;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
