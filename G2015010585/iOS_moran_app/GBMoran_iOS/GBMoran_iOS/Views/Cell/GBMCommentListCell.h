//
//  GBMCommentListCell.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMCommentListCell : UITableViewCell

@property (nonatomic,retain)UILabel     *usernameOfComment;
@property (nonatomic,retain)UILabel     *textOfComment;
@property (nonatomic,retain)UILabel     *dateOfComment;
@property (nonatomic,retain)UIImageView *headImageOfComment;

@end
