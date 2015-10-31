//
//  ViewController.h
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SenderCell.h"
#import "ReceiverCell.h"
#import "ChatInfo.h"


@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *chattingTableView;
@property (strong, nonatomic) NSMutableArray *chatInfoArray;

@end

