//
//  GBMCommentListCell.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMCommentListCell.h"
#import "UIColor+AddColor.h"
@interface GBMCommentListCell()
{
    CGFloat _cellWidth;
}

@end

@implementation GBMCommentListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellWidth = [UIScreen mainScreen].bounds.size.width;
        
        _headImageOfComment = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 40, 40)];
        _headImageOfComment.backgroundColor = [UIColor blueColor];
        _headImageOfComment.layer.cornerRadius = 20;
        [self.contentView addSubview:_headImageOfComment];
        
        
        _usernameOfComment = [[UILabel alloc] initWithFrame:CGRectMake(12+60+9, 7, _cellWidth-24-60-18-100, 18)];
        _usernameOfComment.textColor = [UIColor colorFromHexCode:@"ee7f41"];
        _usernameOfComment.font = [UIFont fontWithName:@"Heiti SC" size:14];
        [self.contentView addSubview:_usernameOfComment];
        
        
        _textOfComment = [[UILabel alloc] initWithFrame:CGRectMake(12+60+9, 30, _cellWidth-24-60-18, 18)];
        _textOfComment.textColor = [UIColor colorFromHexCode:@"444444"];
        _textOfComment.font = [UIFont fontWithName:@"Heiti SC" size:14];
        [self.contentView addSubview:_textOfComment];
        
        
        _dateOfComment = [[UILabel alloc] initWithFrame:CGRectMake((_cellWidth-90-24), 7, 90, 18)];
        _dateOfComment.textColor = [UIColor colorFromHexCode:@"9f9fa0"];
        _dateOfComment.font = [UIFont fontWithName:@"Heiti SC" size:14];
        [self.contentView addSubview:_dateOfComment];
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
