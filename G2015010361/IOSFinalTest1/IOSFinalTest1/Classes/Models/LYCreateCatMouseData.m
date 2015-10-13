//
//  LYCreateCatMouseData.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/13.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYCreateCatMouseData.h"
#import "cat.h"
#import "mouse.h"

@implementation LYCreateCatMouseData
-(void)createMessageData{
    _messageArray = [NSMutableArray array];
    [_messageArray addObject:[cat catName:@"cat1" catHostName:@"host1"]];
    [_messageArray addObject:[cat catName:@"cat2" catHostName:@"host1"]];
    [_messageArray addObject:[cat catName:@"cat3" catHostName:@"host1"]];
    [_messageArray addObject:[cat catName:@"cat4" catHostName:@"host2"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse1" runawayNum:@"13"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse2" runawayNum:@"12"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse3" runawayNum:@"11"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse4" runawayNum:@"10"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse5" runawayNum:@"9"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse6" runawayNum:@"8"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse7" runawayNum:@"7"]];
    [_messageArray addObject:[cat catName:@"cat5" catHostName:@"host2"]];
    [_messageArray addObject:[cat catName:@"cat6" catHostName:@"host2"]];
    [_messageArray addObject:[cat catName:@"cat7" catHostName:@"host3"]];
    [_messageArray addObject:[cat catName:@"cat8" catHostName:@"host3"]];
    [_messageArray addObject:[cat catName:@"cat9" catHostName:@"host3"]];
    [_messageArray addObject:[cat catName:@"cat10" catHostName:@"host4"]];
    [_messageArray addObject:[cat catName:@"cat11" catHostName:@"host4"]];
    [_messageArray addObject:[cat catName:@"cat12" catHostName:@"host4"]];
    //_messageArray2 = [NSMutableArray array];

    [_messageArray addObject:[mouse    mouseName:@"mouse8" runawayNum:@"6"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse9" runawayNum:@"5"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse10" runawayNum:@"4"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse11" runawayNum:@"3"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse12" runawayNum:@"2"]];
    [_messageArray addObject:[mouse    mouseName:@"mouse13" runawayNum:@"1"]];

    
}
@end
