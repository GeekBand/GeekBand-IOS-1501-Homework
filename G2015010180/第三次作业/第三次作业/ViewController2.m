//
//  ViewController2.m
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "ViewController2.h"
#import "Model.h"
@interface ViewController2 ()

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) Model *model;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加界面";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)save:(id)sender {
    if (!self.image.image) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"发生错误~~" message:@"请务必选择你的图片" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }else if([self.word.text  isEqual: @""]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"发生错误~~" message:@"请务必选择你的备注" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }else if([self.name.text  isEqual: @""]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"发生错误~~" message:@"请务必选择你的姓名" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSString *imagepath = [self imagePathForKey:self.word.text];
    NSLog(@"%@",imagepath);
    NSData *imagedata = UIImageJPEGRepresentation(self.image.image, 0.5);
    [imagedata writeToFile:imagepath atomically:YES];
    
    
    NSArray  *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:@"Model.data"];
    NSLog(@"%@",path);
    self.model = [[Model alloc]init];
    self.model.image = imagepath;
    self.model.name = self.name.text;
    self.model.word = self.word.text;
    
    [self GetArrayWith:self.model];
   
    
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
   [archiver encodeObject:self.array forKey:@"Array"]; // archivingDate的encodeWithCoder
    [archiver finishEncoding];
    [data writeToFile:path atomically:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)GetArrayWith:(Model*)s1{
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:@"Model.data"];
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    self.array = [unarchiver decodeObjectForKey:@"Array"];
    if(self.array == nil){
        self.array = [[NSMutableArray alloc]init];
    }
    [unarchiver finishDecoding];
    [self.array addObject:self.model];
}


-(NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [documentDir objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:key];
    return path;
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker= [[UIImagePickerController alloc]init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(nonnull UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.image.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
   
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
