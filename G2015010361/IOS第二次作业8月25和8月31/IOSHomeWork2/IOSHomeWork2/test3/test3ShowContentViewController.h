//
//  test3ShowContentViewController.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest3Message.h"
@interface test3ShowContentViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UILabel                     *_nameLabel;
    UILabel                     *_messageLabel;
    UIImageView                 *_headImage;
}
- (void)setComponentsWithMessage:(LYTest3Message *)aMessage indexPath:(NSIndexPath *)indexPath;
@end

