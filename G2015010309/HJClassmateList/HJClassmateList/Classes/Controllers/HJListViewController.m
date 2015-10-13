//
//  HJListViewController.m
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJListViewController.h"
#import "HJClassmateCell.h"
#import "BLUtility.h"
#import "HJClassmateDB.h"
#import "HJAddClassmateViewController.h"
#import "HJClassmateDetailViewController.h"

@interface HJListViewController ()<UITableViewDataSource,UITableViewDelegate> {
    HJClassmateDB *_db;
    NSMutableArray *_classmatesArray;
}

@end

@implementation HJListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"同学录";
    
    _db = [[HJClassmateDB alloc] init];
    if ([_db tableExists]) {
        NSLog(@"table exists");
    } else {
        NSLog(@"table does not exists");
        _classmatesArray = [[NSMutableArray alloc] initWithCapacity:5];
        
        [_classmatesArray addObject:[HJClassmate classmateWithName:@"林冲"
                                                classmateId: 1
                                                    comment:@"豹子头、小张飞"
                                                    imageInBundle:YES
                                                         imageName:@"linchong"]];
        
        [_classmatesArray addObject:[HJClassmate classmateWithName:@"鲁智深"
                                                       classmateId: 2
                                                           comment:@"花和尚，鲁达，义烈昭暨禅师"
                                                     imageInBundle:YES
                                                         imageName:@"luzhishen"]];;
        
        [_classmatesArray addObject:[HJClassmate classmateWithName:@"宋江"
                                                       classmateId: 3
                                                           comment:@"及时雨，孝义黑三郎，呼保义"
                                                     imageInBundle:YES
                                                         imageName:@"songjiang"]];;
        
        [_classmatesArray addObject:[HJClassmate classmateWithName:@"武松"
                                                       classmateId: 4
                                                           comment:@"武二郎、武行者"
                                                     imageInBundle:YES
                                                         imageName:@"wusong"]];;
        
        [_classmatesArray addObject:[HJClassmate classmateWithName:@"燕青"
                                                       classmateId: 5
                                                           comment:@"燕小乙，浪子"
                                                     imageInBundle:YES
                                                         imageName:@"yanqing"]];;
        
        [_db createClassmateTable];
        [self createOriginalClassmateDB];
    }
    
    _classmatesArray = [_db getAllClassmates];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    if ([_classmatesArray count] != [[_db getAllClassmates] count]) {
        _classmatesArray = [_db getAllClassmates];
        [_tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

- (void)createOriginalClassmateDB {
    for (NSInteger i = 0; i < [_classmatesArray count]; i++) {
        [_db addClassmate:[_classmatesArray objectAtIndex:i]];
    }
}

#pragma mark - UITableViewDataSource,UITableViewDelegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    HJClassmateCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[HJClassmateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([_classmatesArray count] > indexPath.row) {
        [cell setClassmate: [_classmatesArray objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_classmatesArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HJClassmateDetailViewController *detailController = [[HJClassmateDetailViewController alloc] init];
    HJClassmate *classmate = [_classmatesArray objectAtIndex:indexPath.row];
    detailController.classmate = classmate;
    [self.navigationController pushViewController:detailController animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"delete";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_classmatesArray count] > 0 && editingStyle == UITableViewCellEditingStyleDelete) {
        HJClassmate *classmate = [_classmatesArray objectAtIndex:indexPath.row];
        NSString *name = classmate.name;
        if (classmate.imageInBundle == NO) {
            // 沙盒中的图片需要删除
            [[NSFileManager defaultManager] removeItemAtPath:[BLUtility getPathWithinDocumentDir:classmate.imageName] error:nil];
        }
        [_db deleteClassmateWithName:name];

        [_classmatesArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationRight];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addButtonClicked:(id)sender {
    HJAddClassmateViewController *addController = [[HJAddClassmateViewController alloc] init];
    addController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:addController animated:YES];
}


@end
