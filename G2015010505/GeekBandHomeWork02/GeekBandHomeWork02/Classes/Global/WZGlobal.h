//
//  WZGlobal.h
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/2.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMessage.h"

@interface WZGlobal : NSObject

@property (strong, nonatomic) NSMutableArray *messageArray;
@property (strong, nonatomic) NSArray *messageFrames;

+ (WZGlobal *)shareGlobal;

@end
