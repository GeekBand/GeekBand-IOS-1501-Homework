//
//  GWDetailViewController.m
//  同学录
//
//  Created by Will Ge on 8/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWDetailViewController.h"


@interface GWDetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


- (IBAction)SaveUser:(UIButton *)sender;

@end

@implementation GWDetailViewController 

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name.delegate = self;
    self.info.delegate = self;
    
    
    [self registerForKeyboardNotifications];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Take Photo

// Take Photo Action
- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //判断是否有摄像头，没有的话提取相册照片
    if(![UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;   // 设置委托
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示


}

// Finish Picking Media
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil)
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.avator.image = image;
    
}

// Cancel Picking Media
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Save user 

- (IBAction)SaveUser:(UIButton *)sender {
    
    // Create a new GWClassmate instance
    GWClassmate *newClassmate = [[GWClassmate alloc] init];
    
    // Set value
    
    newClassmate.uuid = [[NSUUID UUID] UUIDString];
    newClassmate.avator = UIImagePNGRepresentation(self.avator.image);
    newClassmate.name   = self.name.text;
    
    // Set defaults value if no input info
    if (![self.info.text  isEqual: @""]) {
        newClassmate.info = self.info.text;
    } else {
        newClassmate.info = @"Info not set";
    }
    
    // Save data, only input an available name,
    if (![self.name.text isEqualToString:@""]) {
        
        // Get the default database
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        // Save new instance to database
        [realm beginWriteTransaction];
        [realm addObject:newClassmate];
        [realm commitWriteTransaction];
    }
}


#pragma mark - Handling the keyboard notifications

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
// Adjusting the frame of the content view and scrolling a field above the keyboard
- (void)keyboardWasShown:(NSNotification*)aNotification {
    
    //Get the keyboard height
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Adjust view with animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0 - kbSize.height, self.view.frame.size.width, self.view.frame.size.height)];
    [UIView commitAnimations];
     
     
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{

    // Restore view with animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [UIView commitAnimations];
    
}

#pragma mark - Text field delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - Text field delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


#pragma mark - Navigation

// if no input name equal nil, stop "saveAdd" segue and show alert.
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"saveAdd"]) {
        
        if ([self.name.text isEqualToString:@""]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Name not set, Pealse input name first."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Got it"
                                                  otherButtonTitles:nil];
            [alert show];
            return NO;
            
        }

    }
    return YES;
}



@end
