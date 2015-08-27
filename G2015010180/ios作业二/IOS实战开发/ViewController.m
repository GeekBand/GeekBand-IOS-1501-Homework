//
//  ViewController.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/22.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "ViewController.h"
#import "ViewController3.h"
#import "CMJGlobal.h"

@interface ViewController ()

@property(nonatomic,strong)CMJUser *user;
@property(nonatomic,strong)CMJRequest *request;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.

}


- (IBAction)Second:(id)sender {
    self.request = [[CMJRequest alloc]init];
    [self.request sendLoginRequestWithdelegate:self];
    self.textLabel.text = @"准备中。。。请稍后";
  }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestFailed:(CMJRequest *)request error:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:error.description delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)requestSuccess:(CMJRequest *)request user:(CMJUser *)user
{
    [CMJGlobal shareGloabl].user = user;
    
    
    dispatch_group_t group = dispatch_group_create();
    
    
    
        
        self.textLabel.text = @"下载完成";
    if ( [self.textLabel.text isEqual:@"下载完成"]) {
        
        UIStoryboard *storyboard
        = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        ViewController3 *view3 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController3"];
        [self.navigationController pushViewController:view3 animated:YES];

    }
    
    
  


 
        
    
 

    
}

@end
