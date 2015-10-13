//
//  WZRequest.m
//  WZAFNetworkingTest
//
//  Created by Warren on 15/8/30.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZRequest.h"
#import "AFNetworking.h"
#import "WZParser.h"
#import "WZGlobal.h"

@implementation WZRequest

- (void)requestJson
{
    NSString *urlString = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json";
       //GET
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"success \n%@", responseObject);
        
        WZParser *parser = [[WZParser alloc] init];
        WZMessage *model = [parser parserJson:responseObject];
        
        [model setMessageType:WZMessageTypeOther];
        
        //格式化一个时间
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月-dd日 HH:mm"];//设置格式化标准 yyyy-MM-dd HH:mm:ss
        NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
        
        model.time = dateString;
//        ----------------让相同的时间不显示
        static WZMessage *lastTimeMessage;
        
        if ([lastTimeMessage.time isEqualToString:model.time]) {
            model.hiddenTime = YES;
        }
        
        lastTimeMessage = model;
        //-----------------------------
        [[WZGlobal shareGlobal].messageArray addObject:model]; //单例
         
        NSLog(@"%@", [WZGlobal shareGlobal].messageArray);
        if ([self.delegate respondsToSelector:@selector(requestSuccess:model:)]) {
            [self.delegate requestSuccess:self model:model];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error \n%@", error);
        if ([self.delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [self.delegate requestFailed:self error:error];
        }
    }];
    
    //POST
//    
//    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
}

- (void)requestXML
{
    NSString *urlString = @"http://flash.weather.com.cn/wmaps/xml/beijing.xml";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFXMLParserResponseSerializer alloc] init];
    
    
    //GET
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@---%@", responseObject, [NSThread currentThread]);
        WZParser *parser = [[WZParser alloc] init];
        WZMessage *message = [parser parserXML:responseObject];
        
        
        [message setMessageType:WZMessageTypeSelf];
        
        //格式化一个时间
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月-dd日 HH:mm"];//设置格式化标准 yyyy-MM-dd HH:mm:ss
        NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
        
        message.time = dateString;
        //        ----------------让相同的时间不显示
        static WZMessage *lastTimeMessage;
        
        if ([lastTimeMessage.time isEqualToString:message.time]) {
            message.hiddenTime = YES;
        }
        
        lastTimeMessage = message;
        //-----------------------------
        if (message) {
            [[WZGlobal shareGlobal].messageArray addObject:message]; //单例
            
            NSLog(@"%@", [WZGlobal shareGlobal].messageArray);
        }
        
        if ([self.delegate respondsToSelector:@selector(requestSuccess:model:)]) {
            [self.delegate requestSuccess:self model:message];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"解析失败");
        
        if ([self.delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [self.delegate requestFailed:self error:error];
        }
    }];
}

@end
