//
//  MoranMainTableVc.m
//  GKMoranHouse
//
//  Created by house on 15/8/18.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "MoranMainTableVc.h"
#import "UIColor+Hex.h"
@implementation MoranMainTableVc

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UITabBar *tab =self.tabBar;
    

    [tab setBarTintColor:[UIColor colorWithHexString:@"#d4d5d5"]];
 
    
    UITabBarItem  *squreBarItem= [tab.items objectAtIndex:0 ];
    [squreBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#ee7f41"],NSForegroundColorAttributeName, [UIFont  fontWithName:@"Arial-BoldItalicMT" size:20 ],NSFontAttributeName,nil] forState:UIControlStateSelected];
    [squreBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#a8a8a9"],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    
    squreBarItem.selectedImage = [[UIImage imageNamed:@"square_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [squreBarItem setImage:[[UIImage imageNamed:@"square"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

   
    
    UITabBarItem  *myBarItem= [tab.items objectAtIndex:1];
     [myBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#ee7f41"],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [myBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#a8a8a9"],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    

    myBarItem.selectedImage = [[UIImage imageNamed:@"my_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myBarItem.image = [[UIImage imageNamed:@"my"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
//self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"ee7f41"];
//    [[UINavigationBar appearance] setTintColor:[UIColor yellowColor]];
//    [[UINavigationBar appearance]setBarTintColor:[UIColor yellowColor]];

//   [[UINavigationBar appearance]setBarTintColor:[UIColor yellowColor]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"public_hover"] forState:UIControlStateSelected];
    button.frame = CGRectMake(240, self.view.frame.size.height-70, 44, 44);
    CGPoint p=button.center;
    p.x=self.view.center.x;
    button.center = p;
    [self.view addSubview:button];
//
    
}
@end
