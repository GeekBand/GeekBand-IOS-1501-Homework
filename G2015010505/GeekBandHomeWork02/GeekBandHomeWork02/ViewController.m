//
//  ViewController.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/2.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "ViewController.h"
#import "WZGlobal.h"
#import "WZRequest.h"
#import "WZMessage.h"
#import "WZMessageTableViewCell.h"
#import "WZMessageFrame.h"

@interface ViewController ()<WZRequestDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (nonatomic, strong) WZRequest *request;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;//隐藏系统时间等信息
//}

- (WZRequest *)request
{
    if (!_request) {
        _request = [[WZRequest alloc] init];
    }
    return _request;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.request.delegate = self;
    
    //去掉tableView分界线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //不可选中
    [self.tableView setAllowsSelection:NO];
    
    //背景颜色
    [self.tableView setBackgroundColor:[UIColor colorWithRed:243.0 / 255 green:243.0 / 255 blue:243.0 / 255 alpha:1]];
    
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:100/255.0 alpha:0]];不好用  直接设置图片效果会更好
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    CGFloat duration = [[notification.userInfo valueForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect frame = [[notification.userInfo valueForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    CGFloat offSetY = frame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.view.transform = CGAffineTransformMakeTranslation(0, offSetY);
                     }];
    
    
    NSLog(@"%@", notification.userInfo);
    
//    {
//        UIKeyboardAnimationCurveUserInfoKey = 7;
//        UIKeyboardAnimationDurationUserInfoKey = "0.25";
//        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
//        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 796}";
//        UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 538}";
//        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
//        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
//    }
    
    
//    {
//        UIKeyboardAnimationCurveUserInfoKey = 7;
//        UIKeyboardAnimationDurationUserInfoKey = "0.25";
//        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 258}}";
//        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 538}";
//        UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 796}";
//        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 409}, {375, 258}}";
//        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 667}, {375, 258}}";
//    }

}

- (NSMutableArray *)messageFrames
{
    _messageFrames = [WZMessageFrame messageFrames];
    return _messageFrames;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WZMessageTableViewCell *cell = [WZMessageTableViewCell messageTableViewCellWithTableView:tableView];
    
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messageFrames count];
}

#pragma mark - JSON & XML

- (IBAction)analysisJson:(UIBarButtonItem *)sender
{
    [self.request requestJson];
    [self.view endEditing:YES];
}

- (IBAction)analysisXML:(UIBarButtonItem *)sender
{
    [self.request requestXML];
    [self.view endEditing:YES];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messageFrames[indexPath.row] rowHeight];
}

//设置拖动屏幕 关闭键盘**************************
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //退出键盘
    [self.view endEditing:YES];
}


#pragma mark - WZRequestDelegate

- (void)requestSuccess:(WZRequest *)request model:(WZMessage *)model
{
    NSLog(@"123123\n---%@", self.messageFrames);
    NSLog(@"%@", [WZGlobal shareGlobal].messageArray);
    [self.tableView reloadData];
}

- (void)requestFailed:(WZRequest *)request error:(NSError *)error
{
    NSLog(@"解析失败");
}

#pragma mark - 文本框的代理方法

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *msg = textField.text;
    [self sendMessage:msg type:WZMessageTypeSelf];
    
    if([msg isEqualToString:@"hello"])
    {
        [self sendMessage:@"hi" type:WZMessageTypeOther];
        return YES;
    }
    
    [self sendMessage:@"gun" type:WZMessageTypeOther];
    return YES;
}
//发送消息
- (void)sendMessage:(NSString *)msg type:(WZMessageType)type
{
    //创建模型对象
    WZMessage *message = [[WZMessage alloc] init];
    message.messageType = type;
    message.text = msg;
    //获取当前时间
    NSDate *date = [NSDate date];
    NSDateFormatter *ndf = [[NSDateFormatter alloc] init];
    //    ndf.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    ndf.dateFormat = @"HH:mm";
    
    
    message.time = [ndf stringFromDate:date];
    //    message.hiddenTime
    
    //上一个消息
    WZMessage *preMessage = [self.messageFrames lastObject];
    if ([message.time isEqualToString:preMessage.time]) {
        message.hiddenTime = YES;
    }
    
    WZMessageFrame *msgFrame = [[WZMessageFrame alloc] init];
    msgFrame.message = message;
    //
    [self.messageFrames addObject:msgFrame];
    
    [self.tableView reloadData];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


#pragma mark - MemoryManagementMethod

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
