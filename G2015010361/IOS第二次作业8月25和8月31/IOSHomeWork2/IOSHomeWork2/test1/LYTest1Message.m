//
//  LYTest1Message.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest1Message.h"

@implementation LYTest1Message


@synthesize sender      = _sender;
@synthesize text        = _text;
@synthesize sendDate    = _sendDate;
@synthesize speaker     = _speaker;

+ (LYTest1Message *)messageWithSender:(LYTest1User *)aSender text:(NSString *)aText sendDate:(NSDate *)aDate sendSpeaker:(NSString *)aSpeaker {
    LYTest1Message *message = [[LYTest1Message alloc] init];
    message.sender = aSender;
    message.text = aText;
    message.sendDate = aDate;
    message.speaker = aSpeaker;
    return message;
}

- (void)dealloc {
    self.sender     = nil;
    self.text       = nil;
    self.sendDate   = nil;
}
@end
