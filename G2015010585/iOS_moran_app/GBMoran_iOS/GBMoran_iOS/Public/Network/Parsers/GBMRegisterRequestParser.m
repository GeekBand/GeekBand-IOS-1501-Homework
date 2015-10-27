//
//  GBMRegisterRequestParser.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/18/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMRegisterRequestParser.h"

@implementation GBMRegisterRequestParser

- (GBMUserModel *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"The parser is not work");
    }else {
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
