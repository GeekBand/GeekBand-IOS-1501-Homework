//
//  HJMessage.m
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJMessage.h"

@implementation HJMessage

+ (HJMessage *)messageWithSender:(HJUser *)aSender text:(NSString *)aText {
    HJMessage *message = [[HJMessage alloc] init];
    message.sender = aSender;
    message.text = aText;
    return message;
}

@end
