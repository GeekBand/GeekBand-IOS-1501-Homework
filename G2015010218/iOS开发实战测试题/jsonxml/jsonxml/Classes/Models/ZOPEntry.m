//
//  ZOPEntry.m
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/31.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ZOPEntry.h"

@implementation ZOPEntry

- (void)dealloc
{
    self.name = nil;
    self.summary = nil;
    self.imageURL = nil;
    self.type = nil;
}

@end
