//
//  WZRequest.h
//  WZAFNetworkingTest
//
//  Created by Warren on 15/8/30.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMessage.h"

@class WZRequest;
@protocol WZRequestDelegate <NSObject>

- (void)requestSuccess:(WZRequest *)request model:(WZMessage *)model;
- (void)requestFailed:(WZRequest *)request error:(NSError *)error;

@end


@interface WZRequest : NSObject

@property(weak, nonatomic) id<WZRequestDelegate> delegate;

@property (strong, nonatomic) WZMessage *model;

- (void)requestJson;
- (void)requestXML;

@end
