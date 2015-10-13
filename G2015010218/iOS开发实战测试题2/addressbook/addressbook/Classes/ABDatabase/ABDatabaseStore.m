//
//  ABDatabaseStore.m
//  addressbook
//
//  Created by 黄纪银163 on 15/9/5.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ABDatabaseStore.h"
#import <CoreData/CoreData.h>
#import "ABSchoolmate.h"
#import "Schoolmate.h"

@interface ABDatabaseStore ()
/** 管理对象上下文 */
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

/** 模型文件 */
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;

/** 持久化存储调度器 */
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end


@implementation ABDatabaseStore

- (void)saveAdress:(ABSchoolmate *)schoolmate
{
    Schoolmate *newSchoolmate = [NSEntityDescription insertNewObjectForEntityForName:@"Schoolmate" inManagedObjectContext:self.managedObjectContext];
    
    if (newSchoolmate) {
        newSchoolmate.name = schoolmate.name;
        newSchoolmate.phoneNumber = schoolmate.phoneNumber;
        newSchoolmate.icon = schoolmate.icon;
        
        NSError *error = nil;
        [self.managedObjectContext save:&error];
        
        // 发生错误
        if (error) {
            NSLog(@"保存失败");
        }
    }
}

- (ABSchoolmate *)getAdressWithName:(NSString *)name
{
    // 1.FectchRequest 抓取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Schoolmate"];
    
    // 2.设置过滤条件
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name = %@",name];
    request.predicate = pre;
    
    // 4.执行请求
    NSError *error = nil;
    
    NSArray *schoolmates = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error");
    }
    //遍历同学录
    for (Schoolmate *schoolmate in schoolmates) {
        NSLog(@"名字 %@",schoolmate.name);
    }
    
    Schoolmate *schoolmate = [schoolmates firstObject];
    ABSchoolmate *sm = [[ABSchoolmate alloc] init];
    sm.name = schoolmate.name;
    sm.phoneNumber = schoolmate.phoneNumber;
    sm.icon = schoolmate.icon;
    return sm;
}

- (NSArray *)getAllAdress
{
    // 1.FectchRequest 抓取请求对象
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Schoolmate"];
    
    // 2.执行请求
    NSError *error = nil;
    
    NSArray *schoolmates = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"error");
    }
    
    NSMutableArray *arrayM = [NSMutableArray array];
    // 3 遍历同学录
    for (Schoolmate *schoolmate in schoolmates) {
        ABSchoolmate *sm = [[ABSchoolmate alloc] init];
        sm.name = schoolmate.name;
        sm.phoneNumber = schoolmate.phoneNumber;
        sm.icon = schoolmate.icon;
        NSLog(@"名字 %@",schoolmate.name);
        [arrayM addObject:sm];
    }
    
    return [arrayM copy];
}

- (void)deletedWithName:(NSString *)name
{
    
    // ------------
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Schoolmate" inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (listData.count > 0) {
        Schoolmate *schoolmate = [listData lastObject];
        // 删除
        [self.managedObjectContext deleteObject:schoolmate];
        
        NSError *savingError = nil;
        if ([self.managedObjectContext save:&savingError]) {
            NSLog(@"删除数据成功");
        } else {
            NSLog(@"删除数据失败");
        }
    }
}

#pragma mark - Getter Methods
- (NSManagedObjectContext *)managedObjectContext
{
    if (!_managedObjectContext) {
        if (self.persistentStoreCoordinator) {
            _managedObjectContext = [[NSManagedObjectContext alloc] init];
            [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        }
    }
    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (!_persistentStoreCoordinator) {
        if (self.managedObjectModel) {
            _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
            
            // 数据库地址
            NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            NSString *path = [docPath stringByAppendingPathComponent:@"address.sqlite"];
            NSURL *url = [NSURL fileURLWithPath:path];
            
            [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:nil];
        }
    }
    
    return _persistentStoreCoordinator;
    
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (!_managedObjectModel) {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    return _managedObjectModel;
}

@end
