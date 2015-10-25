//
//  GBMNickNameViewController.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/22/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMNickNameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak,nonatomic) NSString *nickName;

- (IBAction)doneBarButtonClicked:(id)sender;
@end
