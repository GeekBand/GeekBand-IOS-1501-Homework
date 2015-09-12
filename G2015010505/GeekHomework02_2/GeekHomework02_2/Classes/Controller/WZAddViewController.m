//
//  WZAddViewController.m
//  GeekHomework02_2
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZAddViewController.h"
#import "WZMessage.h"
#import "FileManager.h"

@interface WZAddViewController ()

@property (nonatomic, strong) UIImage *photoImage;
//@property (nonatomic, copy) NSString *nameMessage;
//@property (nonatomic, copy) NSString *otherMessage;
@property (nonatomic, copy) NSString *photoUrl;

@property (nonatomic, strong) UITextField *textFieldName;
@property (nonatomic, strong) UITextField *textFieldOther;

@property (nonatomic, strong) WZMessage *message;

@property (nonatomic, strong) NSMutableArray *messageArray;

@end

@implementation WZAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat photoX = self.view.frame.origin.x + 10.0;
    CGFloat photoY = self.view.frame.origin.y + 10.0;
    CGFloat photoWidth = self.view.frame.size.width - 20.0;
    CGFloat photoHeight = 200.0;
    
    UIImageView *photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(photoX, photoY, photoWidth, photoHeight)];
    photoImageView.image = self.photoImage;
    photoImageView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:photoImageView];
   
    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(photoX, 300.0, photoWidth, 50.0)];
//    [self.textFieldName setBackgroundColor:[UIColor grayColor]];
    [self.textFieldName setBorderStyle:UITextBorderStyleRoundedRect];
    [self.textFieldName setPlaceholder:@"请输入姓名"];
    [self.view addSubview:self.textFieldName];
    
    self.textFieldOther = [[UITextField alloc] initWithFrame:CGRectMake(photoX, 400.0, photoWidth, 50.0)];
//    [self.textFieldOther setBackgroundColor:[UIColor grayColor]];
    [self.textFieldOther setBorderStyle:UITextBorderStyleRoundedRect];
    [self.textFieldOther setPlaceholder:@"请输入信息"];
    [self.view addSubview:self.textFieldOther];
    
//    self.textFieldName.delegate = self;
//    self.textFieldOther.delegate = self;
    
    UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(photoX, 500, photoWidth, 50)];
    [doneButton addTarget:self
                   action:@selector(doneButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    doneButton.backgroundColor = [UIColor blackColor];
    [doneButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:doneButton];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(photoX, 580, photoWidth, 50)];
    [cancelButton addTarget:self
                     action:@selector(cancelButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setBackgroundColor:[UIColor redColor]];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.view addSubview:cancelButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(nameAndOtherEndEdit)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.textFieldName];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(nameAndOtherEndEdit)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.textFieldOther];
    
}

- (void)nameAndOtherEndEdit
{
    if (self.textFieldName.text.length || self.textFieldOther.text.length) {
        self.message.name = self.textFieldName.text;
        self.message.other = self.textFieldOther.text;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [[NSMutableArray alloc] init];
    }
    return _messageArray;
}

- (WZMessage *)message
{
    if (!_message) {
        _message = [[WZMessage alloc] init];
    }
    return _message;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *arrayPath = [FileManager getPathWithinDocumentDir:@"/address/messages"];
    NSData *messageData = [NSData dataWithContentsOfFile:arrayPath];
    self.messageArray = (NSMutableArray *)[FileManager unarchiverObject:messageData withKey:@"messageArray"];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    self.photoImage = nil;
//    self.nameMessage = nil;
//    self.otherMessage = nil;
//    self.photoUrl = nil;
//    self.textFieldName = nil;
//    self.textFieldOther = nil;
//    self.message = nil;
}

- (void)doneButtonClicked:(id)sender
{
//    self.message.name = self.nameMessage;
//    self.message.other = self.otherMessage;
//    self.message.photoUrl = self.photoUrl;
    
//    NSMutableArray *messageArray = [WZGlobal shareGlobal].messageArray;
    
    [self.messageArray addObject:self.message];
    
    NSString *arrayPath = [FileManager getPathWithinDocumentDir:@"/address/messages"];
    [FileManager createDirectory:arrayPath lastComponentIsDirectory:NO];
    NSData *messageData = [FileManager archiverObject:self.messageArray forKey:@"messageArray"];
    [messageData writeToFile:arrayPath atomically:YES];//实现归档
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)photoImage
{
    if (!_photoImage) {
        _photoImage = [[UIImage alloc] init];
    }
    //拍照显示
    return _photoImage;
}

//#pragma UITextFieldDelegate
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    if ([textField isEqual:self.textFieldName]) {
//        self.nameMessage = textField.text;
//    } else if ([textField isEqual:self.textFieldOther]) {
//        self.otherMessage = textField.text;
//    }
//    [self.view endEditing:YES];
//    return YES;
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    if ([textField isEqual:self.textFieldName]) {
//        self.nameMessage = textField.text;
//    } else if ([textField isEqual:self.textFieldOther]) {
//        self.otherMessage = textField.text;
//    }
//}
//
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    if ([textField isEqual:self.textFieldName]) {
//        self.nameMessage = textField.text;
//    } else if ([textField isEqual:self.textFieldOther]) {
//        self.otherMessage = textField.text;
//    }
//    return YES;
//}无法获取textField中的text

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
