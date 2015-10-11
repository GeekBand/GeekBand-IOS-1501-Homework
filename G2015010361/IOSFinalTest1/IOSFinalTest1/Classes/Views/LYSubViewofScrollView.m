//
//  LYSubViewofScrollView.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYSubViewofScrollView.h"
#import "AppDelegate.h"
@interface LYSubViewofScrollView ()

@end

@implementation LYSubViewofScrollView



#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    self.title = @"Scroll View";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [backButton setBackgroundColor:[UIColor redColor]];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    self.bgImageView.image = [UIImage imageNamed:@"bgTwo"];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    CGFloat scrollViewWidth = width - 20;
    CGFloat scrollViewHeight = height - 300 - 49 - 37;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 300, scrollViewWidth, scrollViewHeight)];
    _scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(scrollViewWidth * 5, scrollViewHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.maximumZoomScale = 3;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.delegate = self;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth * 5, scrollViewHeight)];
    _contentView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:_contentView];
    
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * scrollViewWidth , 0, scrollViewWidth, scrollViewHeight)];
        if (i % 2 ==0) {
            view.backgroundColor = [UIColor blackColor];
        }else {
            view.backgroundColor = [UIColor whiteColor];
        }
        [_contentView addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
        imageView.backgroundColor = [UIColor clearColor];
        NSString *imageName = [NSString stringWithFormat:@"scroll%i.png", i+1];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)];
        label.font = [UIFont boldSystemFontOfSize:60];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        if (i % 2 ==0) {
            label.text = [NSString stringWithFormat:@"Fracne%i", i + 1];
        }else {
            label.text = [NSString stringWithFormat:@"USA%i", i + 1];
        }
        [view addSubview:label];
    
}






_pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, _scrollView.frame.origin.y + scrollViewHeight, scrollViewWidth, 37)];
_pageControl.numberOfPages = 5;
[_pageControl addTarget:self
                 action:@selector(pageControlClicked:)
       forControlEvents:UIControlEventValueChanged];
//    _pageControl.backgroundColor = [UIColor redColor];
[self.view addSubview:_pageControl];
}

#pragma mark - Custom event methods

- (void)pageControlClicked:(UIPageControl *)pageControl
{
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage * scrollViewWidth, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _contentView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    _pageControl.currentPage = scrollView.contentOffset.x / scrollViewWidth;
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

#pragma mark - Custom event methods

- (void)backButtonClicked:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
