//
//  GBMPublishRequestParser.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMPublishRequestParser.h"

@implementation GBMPublishRequestParser


- (GBMPublishModel*)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"The parser is not work.");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"data"];
            id returnPic = [returnMessage valueForKey:@"pic_id"];
            if ([[returnPic class] isSubclassOfClass:[NSString class]]) {
                GBMPublishModel *user = [[GBMPublishModel alloc] init];
                user.picId = returnPic;
                return user;
            }
        }
    }
    return nil;
}

@end
