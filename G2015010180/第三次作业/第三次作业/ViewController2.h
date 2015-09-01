//
//  ViewController2.h
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *word;

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end
