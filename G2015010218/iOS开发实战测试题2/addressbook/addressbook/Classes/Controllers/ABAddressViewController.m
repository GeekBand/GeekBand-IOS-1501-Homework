//
//  ABAddressViewController.m
//  addressbook
//
//  Created by 黄纪银163 on 15/9/1.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ABAddressViewController.h"
#import "ABDetailViewController.h"
#import "ABDatabaseStore.h"
#import "ABAddressCell.h"

@interface ABAddressViewController ()
/** 添加信息 */
- (IBAction)addAddress:(UIBarButtonItem *)sender;

/** 编辑信息 */
- (IBAction)editAddress:(UIBarButtonItem *)sender;

@property (nonatomic, strong) ABDatabaseStore *store;

/** 同学录 */
@property (nonatomic, strong) NSArray *addresses;
@end

@implementation ABAddressViewController

#pragma mark - Life Cycle Methods
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 回来刷新下表格
    self.addresses = nil;
    [self.tableView reloadData];
}

#pragma mark - DataSources
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.addresses.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ADdressCell";
    ABAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    ABSchoolmate *schoolmate = self.addresses[indexPath.row];
    
    cell.nameLabel.text = schoolmate.name;
    cell.phoneNumberLabel.text = schoolmate.phoneNumber;
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,
                                                             YES) firstObject];
    
    NSString *imageSavePath = [docPath stringByAppendingPathComponent:schoolmate.icon];
    
    cell.iconView.image = [UIImage imageWithContentsOfFile:imageSavePath];
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // 点击push到详情页
    [self performSegueWithIdentifier:@"address2detail" sender:indexPath];
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
/** 编辑调用方法 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        ABSchoolmate *sm = self.addresses[indexPath.row];
        
        // 删除，才操作
        [self.store deletedWithName:sm.name];
        
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,
                                                                 YES) firstObject];
        
        NSString *imageSavePath = [docPath stringByAppendingPathComponent:sm.icon];
        BOOL remove = [[NSFileManager defaultManager] removeItemAtPath:imageSavePath error:nil];
        
        if (remove) {
            NSLog(@"remove");
        }
        
        self.addresses = nil;
        [self.tableView reloadData];
    }
    
}


#pragma mark - Event Methods
- (IBAction)addAddress:(UIBarButtonItem *)sender
{
    
    
}

- (IBAction)editAddress:(UIBarButtonItem *)sender
{
    
    self.tableView.editing = !self.tableView.editing;
}

/** 传递数据 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender
{
    ABDetailViewController *detailVC = segue.destinationViewController;
    if ([detailVC isKindOfClass:[ABDetailViewController class]]) {
        // 传值
        ABSchoolmate *sm = self.addresses[sender.row];
        ABSchoolmate *schoolmate = [[ABSchoolmate alloc] init];
        
        schoolmate.name = sm.name;
        schoolmate.phoneNumber = sm.phoneNumber;
        schoolmate.icon = sm.icon;
        
        detailVC.schoolmate = schoolmate;
    }
}

#pragma mark - Getter Methods 
- (NSArray *)addresses
{
    if (!_addresses) {
        _addresses = [self.store getAllAdress];
    }
    return _addresses;
}

- (ABDatabaseStore *)store
{
    if (!_store) {
        _store = [[ABDatabaseStore alloc] init];
    }
    return _store;
}

@end
