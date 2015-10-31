//
//  Author.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject

@property (copy, nonatomic)NSString *name;
@property (copy, nonatomic)NSString *uri;

+ (id)authorWithADictionary:(NSDictionary *)dictionary;
+ (Author *)sharedAuthor;

@end
