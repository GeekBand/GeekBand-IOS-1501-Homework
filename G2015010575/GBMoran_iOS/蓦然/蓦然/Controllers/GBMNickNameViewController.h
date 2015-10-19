//
//  GBMNickNameViewController.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMReNameRequest.h"

@interface GBMNickNameViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *nickNameTextField;
@property (nonatomic, weak) NSString *nickName;


- (IBAction)doneBarButtonClicked:(id)sender;

@end
