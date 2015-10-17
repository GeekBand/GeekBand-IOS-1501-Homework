//
//  test3AddContentViewController.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class test3AddContentViewController;// 前项声明，下面才能用BLDragonView，不能用＃import

@protocol test3AddContentViewControllerDelegate <NSObject>

@optional
- (void)inputButtonClicked:(test3AddContentViewController *)addContent;//

@end
@interface test3AddContentViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate, UITextViewDelegate>{
    UITextField * _nameField;
    UITextField * _textField;
}
@property(nonatomic,weak) UIImageView *imageView;
@property(nonatomic, weak)id<test3AddContentViewControllerDelegate> delegate;//声明代理变量，第二步。用weak，循环使用问题；

@end

