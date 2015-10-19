//
//  GBMPublishViewController.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMPublishViewController.h"
#import "GBMPublishCell.h"
#import "GBMPublishRequest.h"
#import "GBMGlobal.h"
#import "AppDelegate.h"

#define selfWidth self.view.frame.size.width
#define selfHeight self.view.frame.size.height

@interface GBMPublishViewController ()<GBMPublishRequestDelegate>
{
    BOOL openOrNot;
    BOOL locationOrNot;
    BOOL keyboardOpen;
    CGFloat keyboardOffSet;
    UIButton* publishButton;
    UILabel* titleLabel;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIControl *blackView;

@end

@implementation GBMPublishViewController

- (void)viewDidLoad {
    [self makePublishButton];
    
    
    self.navigationController.navigationBar.backgroundColor = [[UIColor alloc]initWithRed:230/255.0 green:106/255.0 blue:58/255.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [[UIColor alloc]initWithRed:230/255.0 green:106/255.0 blue:58/255.0 alpha:1];
    self.textView.delegate = self;
    [self.navigationController.navigationBar setAlpha:1.0];
   titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, 10, 100, 30)];
    titleLabel.text =@"发布照片";
    titleLabel.textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:titleLabel];
}

//制作tableview
-(void)makeTableView{
    if (!self.tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, selfHeight, selfWidth, 230) style:UITableViewStylePlain];
        [self.tableView setDataSource:self];
        [self.tableView setDelegate:self];
        [self.tableView setBackgroundColor:[UIColor whiteColor]];
        [self.tableView setSeparatorColor:[UIColor blackColor]];
        [self.tableView setShowsHorizontalScrollIndicator:NO];
        [self.tableView setShowsVerticalScrollIndicator:YES];
        [self.tableView registerNib:[UINib nibWithNibName:@"GBMPublishCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"publishCell"];
        [self.view addSubview:self.tableView];
        openOrNot = NO;
    }
    
    if (openOrNot == NO) {
        _blackView = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight-230)];
        [_blackView addTarget:self action:@selector(blackViewTouchDown) forControlEvents:UIControlEventTouchDown];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0;
        [self.view addSubview:_blackView];
        [UIView animateWithDuration:0.5 animations:^{
            [self.tableView setFrame:CGRectMake(0, selfHeight-230, selfWidth, 230)];
            _blackView.alpha = 0.5;
        }
         ];
        openOrNot = YES;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            [self.tableView setFrame:CGRectMake(0, selfHeight, selfWidth, 230)];
            _blackView.alpha = 0;
        }];
        [_blackView removeFromSuperview];
        openOrNot = NO;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
}

//制作发布按钮
-(void)makePublishButton{
    publishButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-65, 0, 50, 40)];
    publishButton.backgroundColor = [UIColor whiteColor];
    publishButton.alpha = 0.8;
    [publishButton setTitle:@"发布" forState:UIControlStateNormal];
    [publishButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [publishButton addTarget:self action:@selector(publishPhotoButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    publishButton.layer.cornerRadius = 3.0;
    publishButton.clipsToBounds = YES;
    [self.navigationController.navigationBar addSubview:publishButton];
}

- (IBAction)publishLocation:(id)sender {
    
   
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchDown:(id)sender {
    [self.textView resignFirstResponder];
    if (openOrNot == YES) {
        [self makeTableView];
    }
}


#pragma mark ------tableView的delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBMPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"publishCell" ];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    cell.nameLabel.text = @"上海";
    cell.placeLabel.text = @"上海浦东国际金融中心";
    return cell;
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    return 63;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (openOrNot == YES) {
        [self makeTableView];
    }
}

- (void)blackViewTouchDown{
    if (openOrNot == YES) {
        [self makeTableView];
    }
}



#pragma mark ------textView的delegate

-(void)textViewDidChange:(UITextView *)textView
{

    if (textView.text.length > 25) {

        [self.textView resignFirstResponder];

    }
    self.numberLabel.text = [NSString stringWithFormat:@"%lu/25",textView.text.length];

}



-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    if ([textView.text isEqualToString:@"你想说的话"]) {
        textView.text = @"";
    }
    
    
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length < 1) {
        textView.text = @"你想说的话";
    }
}

#pragma mark ---弹出键盘时适应
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    if (keyboardOpen == NO) {
        NSDictionary *info = [notification userInfo];
        CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
                CGFloat keyboardHeight = endKeyboardRect.origin.y;
        CGRect textViewRect  = self.textView.frame;
        CGFloat textViewHeight = textViewRect.origin.y+textViewRect.size.height;
        keyboardOffSet = textViewHeight - keyboardHeight;
        CGFloat newy = textViewRect.origin.y - keyboardOffSet;
        [UIView animateWithDuration:duration animations:^{
            [self.textView setFrame:CGRectMake(textViewRect.origin.x, newy, textViewRect.size.width, textViewRect.size.height)];
        }];
        [self.textView setFrame:CGRectMake(textViewRect.origin.x, newy, textViewRect.size.width, textViewRect.size.height)];
        keyboardOpen = YES;
    }
    
}

- (void)keyboardWillHide:(NSNotification *)notification{
    CGRect textViewRect  = self.textView.frame;
    if (keyboardOpen == YES) {
        [UIView animateWithDuration:1 animations:^{
            [self.textView setFrame:CGRectMake(textViewRect.origin.x, textViewRect.origin.y + keyboardOffSet, textViewRect.size.width, textViewRect.size.height)];
        }];
        keyboardOpen = NO;
    }
}



#pragma mark ----发布照片事件

-(void)publishPhotoButtonClicked:(id)sender{
    
    NSData *data = UIImageJPEGRepresentation(self.pulishview.image, 1.0);
    GBMPublishRequest *request = [[GBMPublishRequest alloc]init];
    GBMUserModel *user = [GBMGlobal shareGloabl].user;
    [request sendLoginRequestWithUserId:user.userId token:user.token longitude:@"1" latitude:@"1" title:self.textView.text data:data delegate:self];
    
    
}


-(void)requestSuccess:(GBMPublishRequest *)request picId:(NSString *)picId
{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegate loadMainViewWithController:self];
}


-(void)requestFailed:(GBMPublishRequest *)request error:(NSError *)error
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"重试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}



- (IBAction)returnToCamera:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
