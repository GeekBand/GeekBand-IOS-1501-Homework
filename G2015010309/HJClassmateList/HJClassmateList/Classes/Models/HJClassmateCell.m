//
//  HJClassmateCell.m
//  HJClassmateList
//
//  Created by HeJay on 9/6/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJClassmateCell.h"
#import "BLUtility.h"

@implementation HJClassmateCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        [self.contentView addSubview:_headButton];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 100, 50)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
        
        _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 5, [UIScreen mainScreen].bounds.size.width - 180, 50)];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.font = [UIFont systemFontOfSize:14];
        _commentLabel.textColor = [UIColor purpleColor];
        [self.contentView addSubview:_commentLabel];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Custom methods

- (void)setClassmate:(HJClassmate *)classmate {
    NSString *pathName = [[NSString alloc] init];
    if (classmate.imageInBundle) {
        pathName = [[NSBundle mainBundle] pathForResource:classmate.imageName ofType:@"png"];
    } else {
        pathName = [BLUtility getPathWithinDocumentDir:classmate.imageName];
    }
    
    [_headButton setBackgroundImage:[UIImage imageWithContentsOfFile:pathName] forState:UIControlStateNormal];
    _nameLabel.text = classmate.name;
    _commentLabel.text = classmate.comment;
}

@end
