//
//  LYOneViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYOneViewController.h"
#import "LYSubViewofScrollView.h"
#import "LYSubViewofTextView.h"
#define kOneAlertViewTag        100
#define kPushButtonTag          101
#define kPresentButtonTag       102

@interface LYOneViewController ()

@end

@implementation LYOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Question1~3";
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];//类方法，什么样式都没有
    //也可以用alloc
    pushButton.tag = kPushButtonTag;
    pushButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);//x y 是左上角
    [pushButton setBackgroundColor:[UIColor clearColor]];//clear color 透明色
    UIImage *blueBGImage = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    //图片拉伸 这句的意思是左右边10个像素不变，上下20个像素不变
    [pushButton setBackgroundImage:stretchableBlueBGImage
                          forState:UIControlStateNormal];//图片状态 比如highlight等等
    [pushButton setTitle:@"push the view of Text view" forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pushButton addTarget:self
                   action:@selector(buttonClicked:)//有冒号表示 pushButton传递过去
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.tag = kPresentButtonTag;
    presentButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [presentButton setBackgroundColor:[UIColor clearColor]];
    [presentButton setTitleColor:[UIColor colorWithRed:30 / 255.0f green:90 / 255.0f blue:19 / 255.0f alpha:1] forState:UIControlStateNormal];
    UIImage *whiteBGImage = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage = [whiteBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton setBackgroundImage:stretchableWhiteBGImage
                             forState:UIControlStateNormal];
    [presentButton setTitle:@"present the view of Scroll View" forState:UIControlStateNormal];
    [presentButton setTitle:@"clicked!!!" forState:UIControlStateHighlighted];
    
    [presentButton addTarget:self
                      action:@selector(buttonClicked:)
            forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:presentButton];
    
    UIBarButtonItem *alertButton
    = [[UIBarButtonItem alloc] initWithTitle:@"Alert"
                                       style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(alertButtonClicked:)];
    self.navigationItem.rightBarButtonItem = alertButton;
    
    UIImageView *imageView
    = [[UIImageView alloc] initWithFrame:CGRectMake(10, presentButton.frame.origin.y + presentButton.frame.size.height + 10,self.view.frame.size.width - 80, 100)];
    imageView.image = [UIImage imageNamed:@"scroll1.png"];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, imageView.frame.origin.y + imageView.frame.size.height + 10,self.view.frame.size.width - 20, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:16.0f];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    
    label.text = @"这个navigation controller 包括测试题的 第2题，第3题（除3.10）\n navigation2 是第4题 \n navigation3是第5题 \n nagivation4是第6题\n 第1题，第7题在整个结构中";
    
    CGSize textSize = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width - 25, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], }
                                               context:nil].size;
    
    label.frame = CGRectMake(10, label.frame.origin.y, textSize.width, textSize.height);
}

#pragma mark - Custom event methods

- (void)alertButtonClicked:(UIBarButtonItem *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告信息"
                                                    message:@"这里是alert button "
                                                   delegate:self
                                          cancelButtonTitle:@"ok"
                                          otherButtonTitles:@"详情", nil];
    //在alertview的代理中声明了后面那个函数，一旦点击，可以通过那个函数把值传出来，传出来怎么用就看这里的那个同名函数你怎么写啦
    alert.tag = kOneAlertViewTag;
    [alert show];
    //    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)buttonClicked:(UIButton *)sender
{
    if (sender.tag == kPresentButtonTag) {
        LYSubViewofScrollView *subViewController = [[LYSubViewofScrollView alloc] init];
        [self presentViewController:subViewController animated:YES completion:nil];
        
    }else if(sender.tag == kPushButtonTag) {
        LYSubViewofTextView *subViewController = [[LYSubViewofTextView alloc] init];
        [self.navigationController pushViewController:subViewController animated:YES];
    }
}



#pragma mark - UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == kOneAlertViewTag) {
        NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
        if ([buttonTitle isEqualToString:@"详情"]) {
            UIActionSheet *actionSheet
            = [[UIActionSheet alloc] initWithTitle:@"Action Sheet"
                                          delegate:self
                                 cancelButtonTitle:@"cancel"
                            destructiveButtonTitle:@"destructive"
                                 otherButtonTitles:@"one", @"two", nil];
            //            [actionSheet showInView:self.view];
            //            [actionSheet showFromTabBar:self.tabBarController.tabBar];
            [actionSheet showInView:self.view.window];
        }
    }

}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
