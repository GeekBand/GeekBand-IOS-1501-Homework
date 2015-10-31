//
//  SenderCell.m
//  ChatRoomUI
//
//  Created by Turtleeeeeeeeee on 15/9/1.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "SenderCell.h"

@implementation SenderCell

- (void)setupCellWithChatInfo:(ChatInfo *)info {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    UIImage *originalImage = [UIImage imageNamed:@"sender.png"];
    UIImage *stretchedImage = [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(12, 10, 10, 15)];
    _contentBackgroundImageView.image = stretchedImage;
    _contentBackgroundImageView.layer.cornerRadius = 10;
    _contentLabel.text = info.content;
    _contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel.layer.cornerRadius = 8.0f;
    _portraitImageView.image = info.user.portraitImage;
}

@end
