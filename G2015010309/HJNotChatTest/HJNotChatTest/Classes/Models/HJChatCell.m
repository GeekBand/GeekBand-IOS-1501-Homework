//
//  HJChatCell.m
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJChatCell.h"

@interface HJChatCell() {
    CGFloat _cellWidth;
}

@end

@implementation HJChatCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellWidth = [[UIScreen mainScreen] bounds].size.width;
        self.headButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        self.headButton.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.headButton];
        
        _backImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_backImageView];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_messageLabel];
    }
    
    return self;
}

#pragma mark - Custom methods

- (void)setComponentsWithMessage:(HJMessage *)aMessage indexPath:(NSIndexPath *)indexPath {
    [self cleanComponents];
    _name = aMessage.sender.name;
    if (aMessage.sender.userID == 1001) {
        [self setMessage:aMessage.text left:NO];
    } else {
        [self setMessage:aMessage.text left:YES];
    }
    
}

- (void)setMessage:(NSString *)aText left:(BOOL)isLeft{
    if (isLeft) {
        _headButton.frame = CGRectMake(5, 5, 50, 50);
    } else {
        _headButton.frame = CGRectMake(_cellWidth - 55, 5, 50, 50);
    }
    
    CGFloat textWidth = _cellWidth - 170;
    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                          context:nil].size;
    
    CGRect rect = CGRectMake(55, 5, textSize.width + 10, textSize.height + 10);
    
    if (isLeft) {
        _messageLabel.frame = CGRectMake(60 + 50, rect.origin.y, rect.size.width, rect.size.height);
    
        _backImageView.frame = CGRectMake(rect.origin.x, 5, rect.size.width + 60, rect.size.height);
        UIImage *image = [UIImage imageWithCGImage:[UIImage imageNamed:@"messageBack"].CGImage scale:1 orientation:UIImageOrientationDown];
        _backImageView.image = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    } else {
        _messageLabel.frame = CGRectMake(_cellWidth - 110 - textSize.width, 5, rect.size.width, rect.size.height);
        _backImageView.frame = CGRectMake(_messageLabel.frame.origin.x - 5, rect.origin.y, rect.size.width + 60, rect.size.height);
        UIImage *image = [UIImage imageNamed:@"messageBackMe"];
        _backImageView.image  = [image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    }
    
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.backgroundColor = [UIColor clearColor];
    
    _messageLabel.text = aText;
}

- (void)setHeadImage:(UIImage *)aImage {
    [_headButton setBackgroundImage:aImage forState:UIControlStateNormal];
}

- (void)cleanComponents {
    [_headButton setBackgroundImage:nil forState:UIControlStateNormal];
    _name = nil;
    _messageLabel.text = nil;
}

+ (CGFloat)calculateCellHeightWithMessage:(HJMessage *)aMessage {
    CGFloat textWidth = [[UIScreen mainScreen] bounds].size.width - 170;
    CGSize textSize = [aMessage.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                  context:nil].size;
    if (textSize.height < 70) {
        return 70;
    }
    
    return textSize.height + 20;
}

@end
