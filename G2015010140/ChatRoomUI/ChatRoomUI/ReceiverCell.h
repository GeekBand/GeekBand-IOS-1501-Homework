//
//  ReceiverCell.h
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatInfo.h"

@interface ReceiverCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentBackgroundImageView;

- (void)setupCellWithChatInfo:(ChatInfo *) info;

@end
