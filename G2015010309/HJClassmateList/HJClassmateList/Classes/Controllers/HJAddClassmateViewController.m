//
//  HJAddClassmateViewController.m
//  HJClassmateList
//
//  Created by HeJay on 9/6/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJAddClassmateViewController.h"
#import "BLUtility.h"
#import "HJClassmate.h"
#import "HJClassmateDB.h"

@interface HJAddClassmateViewController ()<UITextFieldDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImageView *_imageView;
    UITextField *_nameTextField;
    UITextField *_commentTextField;
    UIImagePickerController *_imagePicker;
}

@end

@implementation HJAddClassmateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backView.image = [UIImage imageNamed:@"back"];
    [self.view addSubview:backView];
    
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
    
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    NSInteger height = [UIScreen mainScreen].bounds.size.height;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, width - 160, 220)];
    _imageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_imageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 340, 50, 40)];
    nameLabel.text = @"姓名";

    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 340, 200, 40)];
    _nameTextField.font = [UIFont systemFontOfSize:14];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.4 alpha:0.8];
    _nameTextField.placeholder = @"输入姓名";
    _nameTextField.leftView = nameLabel;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.delegate = self;
    _nameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    [self.view addSubview:_nameTextField];
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, 50, 40)];
    commentLabel.text = @"备注";
    
    _commentTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 400, 200, 40)];
    _commentTextField.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.4 alpha:0.8];
    _commentTextField.placeholder = @"输入备注";
    _commentTextField.font = [UIFont systemFontOfSize:14];
    _commentTextField.borderStyle = UITextBorderStyleRoundedRect;
    _commentTextField.leftViewMode = UITextFieldViewModeAlways;
    _commentTextField.delegate = self;
    [self.view addSubview:_commentTextField];
    _commentTextField.leftView = commentLabel;
    
    UIButton *cameraButton = [[UIButton alloc] initWithFrame:CGRectMake(251, 220, 33, 30)];
    [cameraButton setBackgroundImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [cameraButton addTarget:self
                     action:@selector(cameraButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cameraButton];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(50, height - 60, width - 100, 30);
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    saveButton.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:saveButton];
    [saveButton addTarget:self
                   action:@selector(saveButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    _nameTextField.frame = CGRectMake(70, 340, 200, 40);
    _commentTextField.frame = CGRectMake(70, 400, 200, 40);
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _nameTextField.frame = CGRectMake(70, 120, 200, 40);
    _commentTextField.frame = CGRectMake(70, 170, 200, 40);
}

#pragma mark - Custom methods

- (void)cameraButtonClicked:(id)sender {
    _imagePicker.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:_imagePicker animated:YES completion:^{
        NSLog(@"present View controller");
    }];
}

- (void)saveButtonClicked: (id)sender {
//    NSLog(@"savebutton Clicked");
    if (_nameTextField.text != nil && _nameTextField.text.length > 0) {
        NSString *imgName = [NSString stringWithFormat:@"%@.png", _nameTextField.text];
        NSString *encodedImgName = [imgName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedPath = [BLUtility getPathWithinDocumentDir:encodedImgName];
        [UIImagePNGRepresentation(_imageView.image) writeToFile:encodedPath atomically:YES];
        
        HJClassmate *classmate = [[HJClassmate alloc] init];
        classmate.name = _nameTextField.text;
        classmate.comment = _commentTextField.text;
        classmate.imageInBundle = NO;
        classmate.imageName = encodedImgName;
        HJClassmateDB *db = [[HJClassmateDB alloc] init];
        [db addClassmate:classmate];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (image == nil) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    _imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Canceled");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
