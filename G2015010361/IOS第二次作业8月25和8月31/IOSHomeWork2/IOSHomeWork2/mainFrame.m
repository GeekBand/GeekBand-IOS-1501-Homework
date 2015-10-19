//
//  mainFrame.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "mainFrame.h"

#define kPushButtonTag1          101
#define kPushButtonTag2          102
#define kPushButtonTag3          103
@interface mainFrame ()

@end

@implementation mainFrame

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.bgImageView.backgroundColor = [UIColor clearColor];
    self.bgImageView.image = [UIImage imageNamed:@"bgThree"];
    [self.view addSubview:self.bgImageView];
    UIImage *blueBGImage = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    
    UIButton *pushButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton1.tag = kPushButtonTag1;
    pushButton1.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);//x y 是左上角
    [pushButton1 setBackgroundColor:[UIColor clearColor]];//clear color 透明色
    [pushButton1 setBackgroundImage:stretchableBlueBGImage
                          forState:UIControlStateNormal];//图片状态 比如highlight等等
    [pushButton1 setTitle:@"测试题1第一道" forState:UIControlStateNormal];
    [pushButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton1 addTarget:self
                   action:@selector(buttonClicked:)//有冒号表示 pushButton传递过去
         forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton1];
    
    UIButton *pushButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton2.tag = kPushButtonTag2;
    pushButton2.frame = CGRectMake(10, 144, self.view.bounds.size.width - 20, 44);//x y 是左上角
    [pushButton2 setBackgroundColor:[UIColor clearColor]];//clear color 透明色
    [pushButton2 setBackgroundImage:stretchableBlueBGImage
                           forState:UIControlStateNormal];//图片状态 比如highlight等等
    [pushButton2 setTitle:@"测试题1第二道" forState:UIControlStateNormal];
    [pushButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton2 addTarget:self
                    action:@selector(buttonClicked:)//有冒号表示 pushButton传递过去
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton2];
    
    UIButton *pushButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton3.tag = kPushButtonTag3;
    pushButton3.frame = CGRectMake(10, 214, self.view.bounds.size.width - 20, 44);//x y 是左上角
    [pushButton3 setBackgroundColor:[UIColor clearColor]];//clear color 透明色
    [pushButton3 setBackgroundImage:stretchableBlueBGImage
                           forState:UIControlStateNormal];//图片状态 比如highlight等等
    [pushButton3 setTitle:@"测试题2" forState:UIControlStateNormal];
    [pushButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pushButton3 addTarget:self
                    action:@selector(buttonClicked:)//有冒号表示 pushButton传递过去
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton3];

    
}


- (void)buttonClicked:(UIButton *)sender
{
    if (sender.tag == kPushButtonTag1) {
        test1ViewController *subViewController1 = [[test1ViewController alloc] init];
        [self.navigationController pushViewController:subViewController1 animated:YES];
        [sender setBackgroundColor:[UIColor cyanColor]];
    }else if(sender.tag == kPushButtonTag2) {
        test2ViewController *subViewController2 = [[test2ViewController alloc] init];
        [self.navigationController pushViewController:subViewController2 animated:YES];
        [sender setBackgroundColor:[UIColor cyanColor]];
    }else if(sender.tag == kPushButtonTag3) {
        test3ViewController *subViewController3 = [[test3ViewController alloc] init];
        [self.navigationController pushViewController:subViewController3 animated:YES];
        [sender setBackgroundColor:[UIColor cyanColor]];
    }
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
