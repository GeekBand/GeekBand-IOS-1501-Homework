//
//  WZMessage.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/2.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZMessage.h"

@implementation WZMessage

- (instancetype)initWithText:(NSString *)text andMessageType:(WZMessageType)messagetype
{
    self = [super init];
    if (self) {
        self = [[WZMessage alloc] init];
        self.messageType = messagetype;
        self.text = text;
    }
    return self;
}

//+ (instancetype)messageWithText:(NSMutableString *)text andMessageType:(WZMessageType)messagetype
//{
//    return [[WZMessage alloc] initWithText:text andMessageType:messagetype];
//}

@end
