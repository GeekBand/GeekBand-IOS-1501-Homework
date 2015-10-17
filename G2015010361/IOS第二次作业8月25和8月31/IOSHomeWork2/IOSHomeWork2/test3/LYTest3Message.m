//
//  LYTest3Message.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest3Message.h"

@implementation LYTest3Message

+ (LYTest3Message *)messageWithphoto:(LYTest3User *)aSender text:(NSString *)aText name:(NSString *)aName {
    LYTest3Message *message = [[LYTest3Message alloc] init];
    message.sender= aSender;
    message.text = aText;
    message.name = aName;
    return message;
}

@end
