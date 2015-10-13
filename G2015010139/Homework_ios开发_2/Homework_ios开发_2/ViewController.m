//
//  ViewController.m
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "ViewController.h"
#import "MyAccessTool.h"
#import "MyTableViewCell.h"
#import "Classmate.h"
#import "MyDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.isChanged = false;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    if (_isChanged) {
//        
//        self.isChanged = false;
//    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Class Methods

- (void)setIsChanged:(BOOL)isChanged{
    
    _isChanged = isChanged;
}

- (void)reload {
    
    [self.tableView reloadData];
}

- (IBAction)addButtonClicked:(id)sender {
    
    [self performSegueWithIdentifier:@"mainToAdd" sender:sender];
}

#pragma mark - TableViewDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return 2;
    return [MyAccessTool getClassmateNumber];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    
    [cell cleanComponents];
    
    Classmate * cm = [MyAccessTool getClassmateAtIndex:indexPath.row];
    
    
    cell.image.image = cm.image;
    cell.name.text = cm.name;
    cell.content.text = cm.content;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
//    
//    MyTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    MyDetailViewController * detailVC = [MyDetailViewController new];
//    
//    detailVC.image.image = cell.image.image;
//    detailVC.name.text = cell.name.text;
//    detailVC.content.text = cell.content.text;
//    
//    [self showViewController:detailVC sender:self];
//}


#pragma mark - Segue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    if ([segue.identifier isEqualToString:@"mainToDetail"]) {
        
        MyTableViewCell * cell = sender;
        
        MyDetailViewController * des = segue.destinationViewController;
        
        des.imageImage = cell.image.image;
        des.nameText = cell.name.text;
        des.contentText = cell.content.text;
    }
}

@end
