//
//  HJAppInfoCell.m
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJAppInfoCell.h"

@implementation HJAppInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    [self.contentView addSubview:_appImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.numberOfLines = 0;
    [self.contentView addSubview:_nameLabel];
    
    return self;
}

- (void)setAppName:(NSString *)aText {
    CGFloat textWidth = [UIScreen mainScreen].bounds.size.width - 100;
    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                          context:nil].size;
    _nameLabel.frame = CGRectMake(70, 15, textSize.width, textSize.height);
    _nameLabel.text = aText;
}

- (void)setAppImage:(NSString *)aUrlString {
    NSString *encodedString = [aUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedString];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    
    _appImageView.image = [UIImage imageWithData:imageData];
}

+ (CGFloat)calculateCellHeightWithText:(NSString *)aText {
    CGFloat textWidth = [UIScreen mainScreen].bounds.size.width - 100;
    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                          context:nil].size;
    if (textSize.height < 60) {
        return 60;
    } else {
        return textSize.height;
    }
}

@end
