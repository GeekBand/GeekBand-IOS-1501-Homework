//
//  test2ViewController.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest2Request.h"
#import "LYTest2Request2.h"
@interface test2ViewController :UIViewController<UIScrollViewDelegate>{
    UILabel  * _jasonLabel;
    UILabel  * _xmlLabel;
    LYTest2Request *_JSONRequest;
    LYTest2Request2 *_XMLRequest;
    UIScrollView  *_scrollView;
    UIView      *_contentView;
    UIScrollView *_scrollView2;
    UIView      *_contentView2;
}

@end
