//
//  WXMessage.m
//  weixinTableView
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "WXMessage.h"

@implementation WXMessage


#pragma mark - Memory Control Methods
- (void)dealloc
{
    self.userName = nil;
    self.icon = nil;
    self.message = nil;
}
@end
