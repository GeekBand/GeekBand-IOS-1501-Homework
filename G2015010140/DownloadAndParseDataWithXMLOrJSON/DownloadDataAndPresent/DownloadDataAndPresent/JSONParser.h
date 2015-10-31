//
//  JSONParser.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
#import "GameAttributes.h"

@interface JSONParser : NSObject

- (NSArray *)parseAJSONData:(NSData *)data;

@end
