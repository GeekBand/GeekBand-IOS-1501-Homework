//
//  GBMHeadImageViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/22/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMHeadImageViewController.h"
#import "GBMReImageRequest.h"
#import "GBMGlobal.h"
@interface GBMHeadImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate,GBMReImageRequestDelegate>

@end

@implementation GBMHeadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.changeHeadImageButton.layer.cornerRadius = 5.0;
    self.headImageView.image = self.headImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)doneBarButtonClicked:(id)sender
{
    GBMReImageRequest * request= [[GBMReImageRequest alloc]init];
    [request sendReNameRequestWithImage:self.headImageView.image delegate:self];
    
}

-(void)reImageRequestSuccess:(GBMReImageRequest *)request
{
    [GBMGlobal shareGlobal].user.image=self.headImageView.image ;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)reImageRequestFail:(GBMReImageRequest *)request error:(NSError *)error
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)changeHeadImageButtonClicked:(id)sender
{
    [self addActionSheet];
}

// 添加ActionSheet
- (void)addActionSheet
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从手机相册选择", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if (buttonIndex == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"无法获取相机"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    } else if (buttonIndex == 1) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.headImage = info[UIImagePickerControllerOriginalImage];
    self.headImageView.image = self.headImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
