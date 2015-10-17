//
//  LYTest1Message.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYTest1User.h"
@interface LYTest1Message : NSObject{
    LYTest1User      *_sender;
    NSString    *_text;
    NSDate      *_sendDate;
    NSString    *_speaker;
}

@property (nonatomic, retain) LYTest1User *sender;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *speaker;
@property (nonatomic, retain) NSDate *sendDate;

+ (LYTest1Message *)messageWithSender:(LYTest1User *)aSender text:(NSString *)aText sendDate:(NSDate *)aDate sendSpeaker:(NSString *) aSpeaker;


@end


