//
//  WZGlobal.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/2.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZGlobal.h"
#import "WZMessageFrame.h"

static WZGlobal *global = nil;

@implementation WZGlobal

+ (WZGlobal *)shareGlobal
{
    if (!global) {
        global = [[WZGlobal alloc] init];
    }
    return global;
}

- (NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [[NSMutableArray alloc] init];
    }
    
    return _messageArray;
}

//- (NSArray *)messageFrames
//{
//    if (![self.messageArray count]) {//防止多线程 导致无法获取数据
//        return nil;
//    }
//    if (!_messageFrames) {
//        NSMutableArray *messages = self.messageArray;
//        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//        for (WZMessage *message in messages) {
//            WZMessageFrame *messageFrame = [[WZMessageFrame alloc] init];
//            messageFrame.message = message;
//            [tempArray addObject:messageFrame];
//        }
//        _messageFrames = tempArray;
//    }
//    return _messageFrames;
//}

@end
