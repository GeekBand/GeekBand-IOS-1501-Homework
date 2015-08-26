//
//  LGlobal.h
//  Xcode_learn
//
//  Created by house on 15/8/16.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUser.h"
@interface LGlobal : NSObject
@property(nonatomic,strong)LUser *user;
+(LGlobal *)shareGlobal;
@end
