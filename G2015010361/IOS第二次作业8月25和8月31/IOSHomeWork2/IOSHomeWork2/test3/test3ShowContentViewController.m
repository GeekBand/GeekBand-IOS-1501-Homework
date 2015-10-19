//
//  test3ShowContentViewController.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "test3ShowContentViewController.h"
#import "LYTest3Message.h"
@interface test3ShowContentViewController ()

@end

@implementation test3ShowContentViewController

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"测试题2";
    self.navigationItem.title = @"同学录";
    
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor blackColor];
    bgImageView.image = [UIImage imageNamed:@"bgFive"];
    [self.view addSubview:bgImageView];
    
    

  
    
    
    
}
- (void)setComponentsWithMessage:(LYTest3Message *)aMessage indexPath:(NSIndexPath *)indexPath {
//    float _cellWidth = [UIScreen mainScreen].bounds.size.width;
    
    _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80, 150, 150)];
    _headImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_headImage];
    
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 150, 30)];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont boldSystemFontOfSize:16];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_nameLabel];
    
//    
//    _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 32, _cellWidth - 210, 80)];
//    _messageLabel.backgroundColor = [UIColor clearColor];
//    _messageLabel.textColor = [UIColor blackColor];
//    _messageLabel.font = [UIFont boldSystemFontOfSize:16];
//    _messageLabel.textAlignment = NSTextAlignmentCenter;
//    _messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    _messageLabel.numberOfLines = 0;
//    [self.view addSubview:_messageLabel];
//    
    
    _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _messageLabel.textColor = [UIColor blackColor];
    _messageLabel.backgroundColor = [UIColor clearColor];
    
    _messageLabel.font = [UIFont systemFontOfSize:12];
    _messageLabel.numberOfLines = 0;
    _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:_messageLabel];
    
    

    _nameLabel.text = aMessage.name;
    _headImage.image = [UIImage imageWithContentsOfFile:aMessage.sender.headImagePath];
    [self setMessage:aMessage.text];
}

- (void)setMessage:(NSString *)aText {
        float _cellWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat textWidth = _cellWidth - 60;
    
        CGSize textSize = [aText boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12], }
                                              context:nil].size;
        _messageLabel.frame = CGRectMake(30, 280, textSize.width , textSize.height);
        _messageLabel.text = aText;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}



@end