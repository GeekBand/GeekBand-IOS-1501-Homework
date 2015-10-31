//
//  ViewController.m
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _chattingTableView.dataSource = self;
    _chattingTableView.rowHeight = UITableViewAutomaticDimension;
    _chattingTableView.estimatedRowHeight = 70;
    _chattingTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    _chatInfoArray = [NSMutableArray array];
    [self initializeChatInfo];
}

- (void)initializeChatInfo {
    User *sender = [[User alloc] init];
    sender.userName = @"乌龟";
    sender.portraitImage = [UIImage imageNamed:@"樱桃小丸子.jpg"];
    User *receiver = [[User alloc] init];
    receiver.userName = @"我朋友";
    receiver.portraitImage = [UIImage imageNamed:@"黑老大.jpg"];
    
    ChatInfo *info1 = [[ChatInfo alloc] initWithUser:sender isSelf:NO content:@"在吗？"];
    ChatInfo *info2 = [[ChatInfo alloc] initWithUser:receiver isSelf:YES content:@"不在"];
    ChatInfo *info3 = [[ChatInfo alloc] initWithUser:sender isSelf:NO content:@"别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa别玩了，找你有事aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"];
    ChatInfo *info4 = [[ChatInfo alloc] initWithUser:receiver isSelf:YES content:@"就玩"];
    
    [_chatInfoArray addObject:info1];
    [_chatInfoArray addObject:info2];
    [_chatInfoArray addObject:info3];
    [_chatInfoArray addObject:info4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _chatInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *receiverCellIdentifier = @"ReceiveCellIdentifier";
    static NSString *senderCellIdentifier = @"SenderCellIdentifier";
    ChatInfo *info = _chatInfoArray[indexPath.row];
    if (info.isSelf) {
        SenderCell *senderCell = [tableView dequeueReusableCellWithIdentifier:senderCellIdentifier];
        if (senderCell == nil) {
            senderCell = [[SenderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:senderCellIdentifier];
        }
        [senderCell setupCellWithChatInfo:info];
        return senderCell;
    }else{
        ReceiverCell *receiverCell = [tableView dequeueReusableCellWithIdentifier:receiverCellIdentifier];
        if (receiverCell == nil) {
            receiverCell = [[ReceiverCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:receiverCellIdentifier];
        }
        [receiverCell setupCellWithChatInfo:info];
        return receiverCell;
    }
}

@end
