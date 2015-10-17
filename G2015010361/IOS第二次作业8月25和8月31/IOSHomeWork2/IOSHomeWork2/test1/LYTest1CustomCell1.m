//
//  LYTest1CustomCell1.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest1CustomCell1.h"
@interface LYTest1CustomCell1()
{
    CGFloat _cellWidth;
}

@end

@implementation LYTest1CustomCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    
    if (self) {
        
            
            _cellWidth = [UIScreen mainScreen].bounds.size.width;
            
            self.headButton = [[LYTest1Button1 alloc] init];
         //   self.headButton.backgroundColor = [UIColor grayColor];
            [self.headButton addTarget:self
                                action:@selector(headButtonClicked:)
                      forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:self.headButton];
            
            _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _nameLabel.backgroundColor = [UIColor clearColor];
            _nameLabel.textColor = [UIColor blueColor];
            _nameLabel.font = [UIFont boldSystemFontOfSize:15];
            [self.contentView addSubview:_nameLabel];
            
            _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
           // _messageLabel.backgroundColor = [UIColor colorWithRed:173.0/255.0 green:232.0/255.0 blue:112.0/255.0 alpha:1];
            _messageLabel.textColor = [UIColor blackColor];
            _messageLabel.font = [UIFont systemFontOfSize:14];
            _messageLabel.numberOfLines = 0;
            _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [self.contentView addSubview:_messageLabel];
            
            _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.5*_cellWidth - 25, 5, 50, 20)];
            _dateLabel.backgroundColor = [UIColor grayColor];
            _dateLabel.textColor = [UIColor whiteColor];
            _dateLabel.font = [UIFont systemFontOfSize:13];
            _dateLabel.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:_dateLabel];
        
    }
    
    return self;
}

-(void)setCellFrame{
    if ([self.speaker isEqualToString:@"1"]) {
        self.headButton.frame = CGRectMake(5, 40, 50, 50);
        self.headButton.backgroundColor = [UIColor grayColor];
        _messageLabel.backgroundColor = [UIColor whiteColor];

    }else{
        self.headButton.frame = CGRectMake(_cellWidth - 55, 40 , 50, 50);
        self.headButton.backgroundColor = [UIColor blueColor];
        _messageLabel.backgroundColor = [UIColor colorWithRed:173.0/255.0 green:232.0/255.0 blue:112.0/255.0 alpha:1];


    }
    

}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)headButtonClicked:(LYTest1Button1 *)cellButton {
//    if (_delegate && [(NSObject *)_delegate respondsToSelector:@selector(headButtonClicked:)]) {
//        [_delegate headButtonClicked:cellButton];
//    }
}

- (void)cleanComponents {
    [_headButton setBackgroundImage:nil forState:UIControlStateNormal];
    [_headButton setBackgroundImage:nil forState:UIControlStateHighlighted];
    _nameLabel.text = nil;
    _messageLabel.text = nil;
    _dateLabel.text = nil;
//_messageLabel.backgroundColor = [UIColor clearColor];
//    _headButton.frame = CGRectZero;
//    _messageLabel.frame = CGRectZero;
    
    
}

- (void)setComponentsWithMessage:(LYTest1Message *)aMessage indexPath:(NSIndexPath *)indexPath {
    [self setSpeaker:aMessage.speaker];
    [self setCellFrame];
    _headButton.cellSection = indexPath.section;
    _headButton.cellRow = indexPath.row;
    
    [self cleanComponents];
    [self setCellFrame];
    [self setName:aMessage.sender.name];
    [self setMessage:aMessage.text];
    [self setDate:aMessage.sendDate];

}
-(void)setSpeaker:(NSString *)aSpeaker
{
    _speaker = aSpeaker;
}


- (void)setName:(NSString *)aName {
    _nameLabel.text = aName;
}

- (void)setMessage:(NSString *)aText {
    CGFloat textWidth = _cellWidth - 120;
    
    CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14], }
                                          context:nil].size;
    _messageLabel.frame = CGRectMake(60, 32, textSize.width , textSize.height);
    _messageLabel.text = aText;
}

- (void)setDate:(NSDate *)aDate {
//    CGFloat textWidth = _cellWidth - 70;
//    
//    CGFloat originY = _messageLabel.frame.origin.y + _messageLabel.frame.size.height + 5;
//    _dateLabel.frame = CGRectMake(60, originY, textWidth, 18);
    NSDateFormatter *dataformatter = [[NSDateFormatter alloc]init];
    [dataformatter setDateFormat:@"HH:mm"];
    NSString *locationString = [dataformatter stringFromDate:aDate];
    _dateLabel.text = [NSString stringWithFormat:@"%@", locationString];
}

- (void)setHeadImage:(UIImage *)aImage {
    [_headButton setBackgroundImage:aImage forState:UIControlStateNormal];
}

+ (CGFloat)calculateCellHeightWithMessage:(LYTest1Message *)aMessage {
    CGFloat textWidth = [UIScreen mainScreen].bounds.size.width - 120;
    CGSize textSize = [aMessage.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14], }
                                                  context:nil].size;
    CGFloat height = textSize.height + 32 + 5 + 18 + 25;
    return height;
}



- (void)awakeFromNib {
    // Initialization code
}


@end




