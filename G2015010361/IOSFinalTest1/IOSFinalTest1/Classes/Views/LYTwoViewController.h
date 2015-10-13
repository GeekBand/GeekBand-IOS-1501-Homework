//
//  LYTwoViewController.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYBaseViewController.h"

@interface LYTwoViewController : LYBaseViewController<UIWebViewDelegate,UIAlertViewDelegate>
{
    UIWebView                   *_webView;
    UIActivityIndicatorView     *_activityView;
}


@end
