//
//  GBMRegisterRequestParser.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMRegisterRequestParser.h"

@implementation GBMRegisterRequestParser

//得到的数据若是字典，取其中的key值为"message"的value。若此value为nsstring类型，则将值赋予GBMUserModel类型的user中的registerReturnMessage，并返回user，若失败，则返回nil。
- (GBMUserModel *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"The parser is not work.");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"message"];
            if ([[returnMessage class] isSubclassOfClass:[NSString class]]) {
                GBMUserModel *user = [[GBMUserModel alloc] init];
                user.registerReturnMessage = returnMessage;
                
                return user;
            }
        }
    }
    return nil;
}

@end
