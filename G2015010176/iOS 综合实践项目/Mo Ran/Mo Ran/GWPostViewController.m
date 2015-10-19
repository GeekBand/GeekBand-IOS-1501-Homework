//
//  GWPostViewController.m
//  Mo Ran
//
//  Created by Will Ge on 9/20/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWPostViewController.h"

@interface GWPostViewController () <UIImagePickerControllerDelegate,
                                    UINavigationControllerDelegate,
                                    UITextViewDelegate>

@end

@implementation GWPostViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // 设置 UITextViewDelegate
  self.info.delegate = self;
  self.info.returnKeyType = UIReturnKeyDone;

  // TODO: - Get location
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Take Photo

// Take Photo Action
- (IBAction)camera:(UIButton *)sender {

  UIImagePickerControllerSourceType sourceType =
      UIImagePickerControllerSourceTypeCamera;

  //判断是否有摄像头，没有的话提取相册照片
  if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  }

  UIImagePickerController *imagePickerController =
      [[UIImagePickerController alloc] init];
  imagePickerController.delegate = self; // 设置委托
  imagePickerController.sourceType = sourceType;
  imagePickerController.allowsEditing = YES;
  [self presentViewController:imagePickerController
                     animated:YES
                   completion:nil]; //需要以模态的形式展示
}

// Finish Picking Media
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
  [picker dismissViewControllerAnimated:YES
                             completion:^{
                             }];
  UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
  if (image == nil)
    image = [info objectForKey:UIImagePickerControllerOriginalImage];

  self.image.image = image;
}

// Cancel Picking Media
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Cancel and post button methods
- (IBAction)cancel:(UIBarButtonItem *)sender {
  [self dismissViewControllerAnimated:YES
                           completion:^{
                           }];
}

- (IBAction)post:(UIBarButtonItem *)sender {
  [self dismissViewControllerAnimated:YES
                           completion:^{
                             // TODO: - Save data and upload to server
                           }];
}

#pragma mark - Text view delegate
// 换行即结束编辑
- (BOOL)textView:(UITextView *)textView
    shouldChangeTextInRange:(NSRange)range
            replacementText:(NSString *)text {

  if ([text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  return YES;
}

@end
