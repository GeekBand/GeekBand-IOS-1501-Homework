//
//  MyAddViewController.m
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MyAddViewController.h"
#import "Classmate.h"
#import "MyAccessTool.h"
#import "ViewController.h"

#define kOFFSET_FOR_KEYBOARD 30.0f

@interface MyAddViewController ()

@end

@implementation MyAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.image.backgroundColor != [UIColor clearColor]) {
        
        [self.image setTitle:@"从相册中选择" forState:UIControlStateNormal];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Custom Class Methods

- (void)cleanComponents {
    
    self.image.imageView.image = nil;
    self.name.text = nil;
    self.content.text = nil;
}

- (IBAction)cameraButtonClicked:(id)sender {
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setAllowsEditing:YES];
    
    if (sender != self.image && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
     
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
}
- (IBAction)saveButtonClicked:(id)sender {
    
    
    if (![self.name hasText]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                                 message:@"名字不能为空"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        //We add buttons to the alert controller by creating UIAlertActions:
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"知道了"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil]; //You can use a block here to handle a press on this button
        [alertController addAction:actionOk];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    Classmate * cm = [Classmate new];
    
    cm.image =  [self.image backgroundImageForState:UIControlStateNormal];
    cm.name = self.name.text;
    cm.content = self.content.text;
    
    [MyAccessTool saveClassmate:cm];
    
    [self cleanComponents];
    
    [self performSegueWithIdentifier:@"addToMain" sender:sender];
}



-(void)setViewMovedUp:(BOOL)movedUp {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp) {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    } else {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    
    //存储图片
    NSString * type = [info objectForKey:UIImagePickerControllerMediaType];
    
    if([type isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *orign = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage * edited = [info objectForKey:UIImagePickerControllerEditedImage];
        
        if (edited != nil) {
            
            [self.image setBackgroundImage:edited forState:UIControlStateNormal];
            [self.image setBackgroundImage:edited forState:UIControlStateHighlighted];
            
        } else {
            
            [self.image setBackgroundImage:orign  forState:UIControlStateNormal];
            [self.image setBackgroundImage:orign forState:UIControlStateHighlighted];
        }
        
        [self.image setBackgroundColor:[UIColor clearColor]];
        [self.image setTitle:nil forState:UIControlStateNormal];
        //保存图片
        if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)UIImageWriteToSavedPhotosAlbum(edited, self, nil, nil);
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - TextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.activeTextField == self.name) {
        
        [self.activeTextField resignFirstResponder];
        
        [self.content becomeFirstResponder];
    } else {
        [self.activeTextField resignFirstResponder];
    }
    
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (self.view.frame.origin.y >=0) {
        
        [self setViewMovedUp:YES];
    }
    
    self.activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.view.frame.origin.y < 0) {
        
        [self setViewMovedUp:NO];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.activeTextField resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"my"]) {
//        ((ViewController *)segue.destinationViewController).isChanged = true;
//        NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
//            
//        }];
//        
//        [op setQualityOfService:NSQualityOfServiceUserInteractive];
//        
//        [[NSOperationQueue mainQueue] addOperation:op];
        
    }
}

@end
