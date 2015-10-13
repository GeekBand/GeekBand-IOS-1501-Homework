//
//  ABAddMembersController.m
//  addressbook
//
//  Created by 黄纪银163 on 15/9/4.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ABAddMembersController.h"
#import "ABDatabaseStore.h"
#import "ABSchoolmate.h"

@interface ABAddMembersController ()
<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) ABDatabaseStore *databaseStore;

@end

@implementation ABAddMembersController

#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfieldDidChangeText:) name:UITextFieldTextDidChangeNotification object:nil];
}


#pragma mark - Memery Control
- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.databaseStore = nil;
    self.imagePickerController = nil;
}

#pragma mark - Event Methods
- (IBAction)addIconImage:(id)sender
{
    // 能否打开摄像头
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.imagePickerController.delegate = self;
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.imagePickerController.allowsEditing = YES;
        
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }
}

- (IBAction)save:(id)sender
{
    // 保存时做
    if (self.nameField.text.length > 0 && self.phoneField.text.length > 0) {
        
        ABSchoolmate *schoolmate = [[ABSchoolmate alloc] init];
        schoolmate.name = self.nameField.text;
        
        if (self.iconView.image) {
            NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                     NSUserDomainMask,
                                                                     YES) firstObject];
            
            NSString *dataName = [NSString stringWithFormat:@"pic_%@.png", self.nameField.text];
            
            NSString *imageSavePath = [docPath stringByAppendingPathComponent:dataName];
            
            NSData *data = UIImagePNGRepresentation(self.iconView.image);
            
            if (data == nil) {
                data = UIImageJPEGRepresentation(self.iconView.image, 1.0);
            }
            
            [data writeToFile:imageSavePath atomically:YES];
            
            schoolmate.icon = dataName;
            
        }
        
        schoolmate.phoneNumber = self.phoneField.text;
        [self.databaseStore saveAdress:schoolmate];
    }
    
    // 退出
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)back:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.phoneField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 文字输入改变通知
- (void) textfieldDidChangeText:(NSNotification *)note
{
    if (self.nameField.text.length > 0 && self.phoneField.text.length > 0)
    {
        self.saveBtn.enabled = YES;
        self.saveBtn.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        self.saveBtn.enabled = NO;
        self.saveBtn.backgroundColor = [UIColor lightGrayColor];
    }
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerEditedImage"];
    // 设置头像
    if (image) {
        self.iconView.image = image;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
/** 取消 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Getter Methods
- (UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
    }
    return _imagePickerController;
}

- (ABDatabaseStore *)databaseStore
{
    if (!_databaseStore) {
        _databaseStore = [[ABDatabaseStore alloc] init];
    }
    return _databaseStore;
}
@end
