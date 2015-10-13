//
//  LYSubViewofScrollView.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYBaseViewController.h"

@interface LYSubViewofScrollView : LYBaseViewController<UIScrollViewDelegate>
{
    UIScrollView            *_scrollView;
    UIPageControl           *_pageControl;
    UIView                  *_contentView;
}

@end
