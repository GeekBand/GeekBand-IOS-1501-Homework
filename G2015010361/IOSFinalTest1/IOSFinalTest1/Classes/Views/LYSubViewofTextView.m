//
//  LYSubViewofTextView.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYSubViewofTextView.h"
#import  "AppDelegate.h"
@interface LYSubViewofTextView ()

@end

@implementation LYSubViewofTextView

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Text View";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [backButton setBackgroundColor:[UIColor purpleColor]];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    self.bgImageView.image = [UIImage imageNamed:@"bgThree"];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width - 20, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"please input password";
    //    textField.secureTextEntry = YES;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    textField.keyboardType = UIKeyboardTypeEmailAddress;
    textField.returnKeyType = UIReturnKeyDone;
    textField.font = [UIFont systemFontOfSize:14.0f];
    textField.textColor = [UIColor orangeColor];
    textField.delegate = self;
    textField.contentVerticalAlignment = UIViewContentModeCenter;
    [self.view addSubview:textField];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, textField.frame.origin.y + 31 + 10, self.view.frame.size.width - 20, 40)];
    textView.backgroundColor = [UIColor cyanColor];
    textView.textColor = [UIColor blackColor];
    textView.delegate = self;
    textView.keyboardType = UIKeyboardTypeEmailAddress;
    textView.returnKeyType = UIReturnKeyGo;
    [self.view addSubview:textView];
    
    
    
    
    
}


#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"%@", textView);
}

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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

#pragma mark - Custom event methods

- (void)backButtonClicked:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
        //    [self.navigationController popToRootViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
