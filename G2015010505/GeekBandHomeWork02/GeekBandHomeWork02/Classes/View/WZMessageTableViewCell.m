//
//  WZMessageTableViewCell.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZMessageTableViewCell.h"
#import "UIImage+Extension.h"

@interface WZMessageTableViewCell ()

@property (weak, nonatomic) UILabel *timeLabelView;
@property (weak, nonatomic) UIImageView *headView;
@property (weak, nonatomic) UIButton *textButtonView;

@end

@implementation WZMessageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置cell背景透明或者设置cell颜色
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor colorWithRed:240.0 green:240.0 blue:240.0 alpha:1];
        
        //time
        UILabel *timeLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:timeLabelView];
        self.timeLabelView = timeLabelView;
        //设置居中
        self.timeLabelView.textAlignment = NSTextAlignmentCenter;
        
        //headImage
        UIImageView *headView = [[UIImageView alloc] init];
        [self.contentView addSubview:headView];
        self.headView = headView;
        
        //headImage设置为圆角
        headView.layer.cornerRadius = 25;//设置为原型 所以半径取正方形边长的一半
        headView.layer.masksToBounds = YES;//设置裁剪
        
        //textButton聊天内容
        UIButton *textButtonView = [[UIButton alloc]init];
        [self.contentView addSubview:textButtonView];
        self.textButtonView = textButtonView;
        
        //设置字体大小size
        textButtonView.titleLabel.font = [UIFont systemFontOfSize:WZFontSize];
        
        //设置字体颜色
        [textButtonView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置换行
        textButtonView.titleLabel.numberOfLines = 0;//自动换行
        
        //-----------------------------------
        //设置button中字体的边距
        textButtonView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        
    }
    return self;
}

+ (instancetype)messageTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *cellReuseID = @"messageCell";
    
    WZMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseID];
    
    if (!cell) {
        cell = [[WZMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:cellReuseID];
    }
    
    return cell;
}

- (void)setMessageFrame:(WZMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    
    //给控件赋值
    self.timeLabelView.text = messageFrame.message.time;
    
    if (messageFrame.message.messageType == WZMessageTypeSelf) {
        self.headView.image = [UIImage imageNamed:@"me"];
    } else if(messageFrame.message.messageType == WZMessageTypeOther){
        self.headView.image = [UIImage imageNamed:@"other"];
    }
    
    [self.textButtonView setTitle:messageFrame.message.text forState:UIControlStateNormal];
    
    
    
//    self.textButtonView.backgroundColor = [UIColor greenColor];//测试button范围
    
    //设置button背景图片
    if (messageFrame.message.messageType == WZMessageTypeSelf) {
        [self.textButtonView setBackgroundImage:[UIImage resizeImageWithName:@"SenderAppNodeBkg_HL"]
                                       forState:UIControlStateNormal];
    } else {
        [self.textButtonView setBackgroundImage:[UIImage resizeImageWithName:@"ReceiverTextNodeBkg"]
                                       forState:UIControlStateNormal];
    }
    //设置控件frame
    
    self.headView.frame = messageFrame.headViewFrame;
    self.textButtonView.frame = messageFrame.textButtonFrame;
    self.timeLabelView.frame = messageFrame.timeLabelFrame;
//    if (!messageFrame.message.isHiddenTime) {
//        self.timeLabelView.frame = messageFrame.timeLabelFrame;
//    } else {
//        self.timeLabelView.frame = CGRectZero;
//    }
    
}

//缩放图片（平铺）
//- (UIImage *)resizeImageWithName:(NSString *)imageName
//{
//    //    [backgroundImage resizableImageWithCapInsets:]平铺效果，被strechableImageWithLeftCapWidth：调用
//    //    [backgroundImage resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>]拉伸图片
//
//    
//    UIImage *image = [UIImage imageNamed:imageName];
//    image = [image stretchableImageWithLeftCapWidth:image.size.width / 2 topCapHeight:image.size.height / 2];
//    return image;
//}

@end
