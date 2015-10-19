//
//  LYTest3CustomCell.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest3CustomCell.h"

@interface LYTest3CustomCell()
{
    CGFloat _cellWidth;
}

@end

@implementation LYTest3CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    
    if (self) {
        
        
        _cellWidth = [UIScreen mainScreen].bounds.size.width;
        
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 32, 40, 40)];
        _headImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_headImage];
//        UIImageView *oneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.bounds.size.width , self.contentView.bounds.size.height)];
//        oneImageView.backgroundColor = [UIColor yellowColor];
//        [self.contentView addSubview:oneImageView];
        UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(60.0, 0.0, 1.0, 300.0)];
        [lineView1 setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:lineView1];

        UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(190.0, 0.0, 1.0, 300.0)];
        [lineView2 setBackgroundColor:[UIColor lightGrayColor]];
        [self.contentView addSubview:lineView2];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 32, 120, 80)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
        
//        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        // _messageLabel.backgroundColor = [UIColor colorWithRed:173.0/255.0 green:232.0/255.0 blue:112.0/255.0 alpha:1];
//        _messageLabel.textColor = [UIColor blackColor];
//        _messageLabel.backgroundColor = [UIColor clearColor];
//
//        _messageLabel.font = [UIFont systemFontOfSize:18];
//        _messageLabel.numberOfLines = 0;
//        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        [self.contentView addSubview:_messageLabel];
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 32, _cellWidth - 210, 80)];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont boldSystemFontOfSize:16];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
        
    }
    
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)cleanComponents {
    _nameLabel.text = nil;
    _messageLabel.text = nil;
    _headImage.image = nil;
}

- (void)setComponentsWithMessage:(LYTest3Message *)aMessage indexPath:(NSIndexPath *)indexPath {
   //_headButton.cellSection = indexPath.section;
    //headButton.cellRow = indexPath.row;
    
    //[self cleanComponents];
    [self setName:aMessage.name];
    [self setMessage:aMessage.text];
   // [self setHeadImage:aMessage.photo];
    
}

- (void)setName:(NSString *)aName {
    _nameLabel.text = aName;
    
}

- (void)setMessage:(NSString *)aText {
//    CGFloat textWidth = _cellWidth - 200;
//    
//    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
//                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
//                                       attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], }
//                                          context:nil].size;
//    _messageLabel.frame = CGRectMake(200, 32, textSize.width , textSize.height);
    _messageLabel.text = aText;
}



- (void)setHeadImage:(UIImage *)aImage {
    _headImage.image = aImage;
}

+ (CGFloat)calculateCellHeightWithMessage:(LYTest3Message *)aMessage {
    CGFloat textWidth = [UIScreen mainScreen].bounds.size.width - 200;
    CGSize textSize = [aMessage.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], }
                                                  context:nil].size;
    CGFloat height = textSize.height + 32 + 32;
    return height;
}



- (void)awakeFromNib {
    // Initialization code
}


@end


