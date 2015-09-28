//
//  HJAppInfo.h
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJAppInfo : NSObject

@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSMutableArray *imageArray;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *artist;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *right;
@property (nonatomic, copy) NSString *appLink;
@property (nonatomic, copy) NSString *bundleID;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, copy) NSString *appType;

@end
