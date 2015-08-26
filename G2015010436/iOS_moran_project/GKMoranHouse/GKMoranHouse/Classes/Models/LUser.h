//
//  LUser.h
//  Xcode_learn
//
//  Created by house on 15/8/15.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LAddress.h"
@interface LUser : NSObject
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString *headImageUrl;
@property(nonatomic,strong)LAddress *address;
@end
