//
//  GBMLoginRequestParser.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMLoginRequestParser.h"

@implementation GBMLoginRequestParser

- (GBMUserModel *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"The parser is not work.");
    }else{
        GBMUserModel *user = [[GBMUserModel alloc] init];
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            
            id data = [jsonDic valueForKey:@"data"];
            if ([[data class] isSubclassOfClass:[NSDictionary class]]) {
                
                id userId = [data valueForKey:@"user_id"];
                if ([[userId class] isSubclassOfClass:[NSString class]]) {
                    user.userId = userId;
                }
                
                id token = [data valueForKey:@"token"];
                if ([[token class] isSubclassOfClass:[NSString class]]) {
                    user.token = token;
                }
                
                id userName = [data valueForKey:@"user_name"];
                if ([[userName class] isSubclassOfClass:[NSString class]]) {
                    user.userName = userName;
                }
                
                
            }
            
            id returnMessage = [jsonDic valueForKey:@"message"];
            if ([[returnMessage class] isSubclassOfClass:[NSString class]]) {
                
                user.loginReturnMessage = returnMessage;
                
                
            }
            
            return user;
            
        }
    }
    
    return  nil;
}

@end
