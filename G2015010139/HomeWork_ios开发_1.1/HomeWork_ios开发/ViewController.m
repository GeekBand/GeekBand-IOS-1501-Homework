//
//  ViewController.m
//  HomeWork_ios开发
//
//  Created by john on 15/9/27.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //读取信息数据
    const NSString *MsgKey = @"msg";
    const NSString *MineKey = @"ismine";
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
    
    self.dialogMessages =[[NSMutableArray alloc]init];
    [dataArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        Message *message = [[Message alloc] init];
        message.message = dict[MsgKey];
        message.isMine = [dict[MineKey] boolValue];
        [self.dialogMessages addObject:message];
    }];
    
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewCellDelegate and SourceDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dialogMessages count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *msg = self.dialogMessages[indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:12];
    CGRect rect =  [msg.message boundingRectWithSize:CGSizeMake(115, 400) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    CGSize size = rect.size;
    size.height += 4;
    
    //判断对话框的高度，如果比头像矮就设置为头像高度，否则就设置为对话框的文本高度加上间隔
    if (size.height < 55) {
        return 55;
    }
    else{
        //与边线的间隔加上文本的上下缩进
        return size.height+25+5;
    }
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float buttonHeight,buttonWidth;
    NSString *CellIdentifier=@"CellIdentifier";
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//消去边线
    Message *msg = self.dialogMessages[indexPath.row];
    UIFont *font = [UIFont systemFontOfSize:12];//设置字体，这里使用了系统默认字体
    CGRect rect =  [msg.message boundingRectWithSize:CGSizeMake(115, 400) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    CGSize size = rect.size;
    
    //设置宽度
    if (size.height < 16) {
        CGRect rectSec =  [msg.message boundingRectWithSize:CGSizeMake(500, 15) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
        CGSize sizeSec = rectSec.size;
        buttonWidth = sizeSec.width +35;//35是前缩进加上后缩进的宽度
    } else{
        buttonWidth = 150;
    }
    
    //设置对话框高度
    if (size.height <50) {
        buttonHeight = 50;//高度小于照片高度的就设置为照片高度
    } else{
        buttonHeight = size.height +25;
    }
    
    UIImage *normalImage,*highlightedImage;
    UIButton *dialogMessageButton =[[UIButton alloc]init];
    UIEdgeInsets insets;
    UIImage *headImage;
    UIImageView *headImageView =[[UIImageView alloc]init];
    
    //判断信息来源，自己和别人的不一样的处理
    if (msg.isMine ==true) {
        headImage =[UIImage imageNamed:@"me.png"];
        [headImageView setFrame:CGRectMake(5, 5, 50, 50)];
        
        normalImage = [UIImage imageNamed:@"mychat_normal"];
        highlightedImage = [UIImage imageNamed:@"mychat_focused"];
        insets = UIEdgeInsetsMake(10, 25, 15, 10);//设置文本的内边框，使文字与对话框更协调
        [dialogMessageButton setContentEdgeInsets:insets];//设置缩进
        [dialogMessageButton setFrame:CGRectMake(55, 5, buttonWidth, buttonHeight)];
        [dialogMessageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    else{
        headImage =[UIImage imageNamed:@"mate.png"];
        [headImageView setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 5 - 50, 5, 50, 50)];
        
        normalImage = [UIImage imageNamed:@"matechat_normal"];
        highlightedImage = [UIImage imageNamed:@"matechat_focused"];
        insets = UIEdgeInsetsMake(10, 10, 15, 25);//设置文本的内边框
        [dialogMessageButton setFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-buttonWidth-55, 5,buttonWidth, buttonHeight)];
        [dialogMessageButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];//设置点击时文字颜色变成蓝色
    }
    
    [headImageView setImage:headImage];
    
    
    NSMutableString *buttonName =[[NSMutableString alloc]initWithFormat:@"%@",msg.message];
    [dialogMessageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    normalImage = [normalImage stretchableImageWithLeftCapWidth:normalImage.size.width*0.5 topCapHeight:normalImage.size.height*0.6];//设置图片拉伸区域
    highlightedImage = [highlightedImage stretchableImageWithLeftCapWidth:highlightedImage.size.width*0.5 topCapHeight:highlightedImage.size.height*0.6];//设置图片拉伸区域
    [dialogMessageButton setBackgroundImage:normalImage forState:UIControlStateNormal];//设置对话框图片
    [dialogMessageButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];//设置点击时对话框图片
    [dialogMessageButton setTitle:buttonName forState:UIControlStateNormal];
    [dialogMessageButton setContentEdgeInsets:insets];//设置缩进
    dialogMessageButton.titleLabel.font = font;
    dialogMessageButton.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    dialogMessageButton.titleLabel.numberOfLines = 0;
    [dialogMessageButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [dialogMessageButton.titleLabel sizeToFit];
    [dialogMessageButton setContentMode:UIViewContentModeBottomLeft];
    
    [cell.contentView addSubview:headImageView];
    [cell.contentView addSubview:dialogMessageButton];
    
    return cell;
}

@end
