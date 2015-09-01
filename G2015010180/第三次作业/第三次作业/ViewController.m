//
//  ViewController.m
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//
#import "Model.h"
#import "ViewController.h"
#import "Cell.h"
#import "ViewController3.h"

@interface ViewController ()
{
    NSArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TableView.delegate = self;
    self.TableView.dataSource =self;
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:@"Model.data"];
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
     array = [unarchiver decodeObjectForKey:@"Array"];// initWithCoder方法被调用
    [unarchiver finishDecoding];


    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:@"Model.data"];
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    array = [unarchiver decodeObjectForKey:@"Array"];// initWithCoder方法被调用

    [self.TableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return array.count;
}


-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 90;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    Model *model = [array objectAtIndex:indexPath.row];
    cell.name.text = model.name;
    cell.word.text = model.word;
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:model.word];
    model.image = path;
    cell.Image.image = [UIImage imageWithContentsOfFile:model.image];
    cell.backgroundColor = [[UIColor alloc]initWithRed:212/255.0 green:234/255.0 blue:164/255.0 alpha:1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
   
    Model *model = [array objectAtIndex:indexPath.row];
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     ViewController3 *view = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController3"];
    view.model = model;
    [self.navigationController pushViewController:view animated:YES];

}

@end
