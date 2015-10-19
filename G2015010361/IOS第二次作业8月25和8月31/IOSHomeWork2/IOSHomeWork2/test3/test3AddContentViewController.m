//
//  test3AddContentViewController.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "test3AddContentViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "test3ViewController.h"
@interface test3AddContentViewController ()

@end

@implementation test3AddContentViewController

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"测试题2";
    self.navigationItem.title = @"添加新同学";
    
 
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor clearColor];
    bgImageView.image = [UIImage imageNamed:@"bgFour"];
    [self.view addSubview:bgImageView];
    
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(80, 240, 150, 30)];
    _nameField.borderStyle = UITextBorderStyleRoundedRect;
    _nameField.placeholder = @"please input name";
    _nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameField.returnKeyType = UIReturnKeyDone;
    _nameField.font = [UIFont systemFontOfSize:14.0f];
    _nameField.textColor = [UIColor cyanColor];
    _nameField.delegate = self;
    _nameField.contentVerticalAlignment = UIViewContentModeCenter;
    [self.view addSubview:_nameField];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(80, 290, 150, 30)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = @"please input comment";
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.font = [UIFont systemFontOfSize:14.0f];
    _textField.textColor = [UIColor cyanColor];
    _textField.delegate = self;
    _textField.contentVerticalAlignment = UIViewContentModeCenter;
    [self.view addSubview:_textField];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 40, 30)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"姓名";
    [self.view addSubview:nameLabel];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 290, 40, 30)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor blackColor];
    textLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = @"备注";
    [self.view addSubview:textLabel];
    
    UIButton *takePhote = [UIButton buttonWithType:UIButtonTypeCustom];
    takePhote.frame = CGRectMake(80, 80, 100, 100);//x y 是左上角
    [takePhote setBackgroundColor:[UIColor clearColor]];
    [takePhote setTitle:@"📷" forState:UIControlStateNormal];
    takePhote.titleLabel.font = [UIFont boldSystemFontOfSize:100];
    [takePhote setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [takePhote addTarget:self
                    action:@selector(buttonClicked:)//有冒号表示 pushButton传递过去
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:takePhote];
    
    UIButton *writeIn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeIn.frame = CGRectMake(80, 330, 150, 20);//x y 是左上角
    [writeIn setBackgroundColor:[UIColor redColor]];
    [writeIn setTitle:@"储存" forState:UIControlStateNormal];
    writeIn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [writeIn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [writeIn addTarget:self
                  action:@selector(buttonClicked2:)//有冒号表示 pushButton传递过去
        forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:writeIn];
    

    

    
}
- (void)buttonClicked:(UIButton *)sender
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有摄像头
//    if(![UIImagePickerController isSourceTypeAvailable:sourceType])
//    {
//        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;   // 设置委托
    imagePickerController.sourceType = sourceType;
    imagePickerController.allowsEditing = YES;
    [self presentViewController:imagePickerController animated:YES completion:nil];  //需要以模态的形式展示

    

}
- (void)buttonClicked2:(UIButton *)sender
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (!docDir) {
        NSLog(@"Documents 目录未找到");
    }
    NSArray *array = [[NSArray alloc] initWithObjects:_nameField.text,_textField.text,nil];
   // NSString *fileName = [_nameField.text   stringByAppendingString:@".txt"];
    NSString *fileName = @"1.txt";
    NSString *filePath = [docDir stringByAppendingPathComponent:fileName];
    [array writeToFile:filePath atomically:YES];
    [self inputButtonClicked:self];
}

#pragma mark 
#pragma mark UIImagePickerController Method
//完成拍照
#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
   // NSString *photoName = [_nameField.text stringByAppendingString:@".png"];
    NSString *photoName = @"1.png";
    [self saveImage:image withName:photoName];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    
    //isFullScreen = NO;
    [self.imageView setImage:savedImage];
    
    self.imageView.tag = 100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"end%@", textField.text);
    //write to sand box

}
- (void)inputButtonClicked:(test3AddContentViewController *)addContent{
    if ([_delegate respondsToSelector:@selector(inputButtonClicked:)]) {
        [_delegate inputButtonClicked:self];//调用代理方法，第三步，把自己传过去
    }
}
@end