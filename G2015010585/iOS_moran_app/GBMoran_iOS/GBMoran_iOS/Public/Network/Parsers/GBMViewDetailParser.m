//
//  GBMViewDetailParser.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMViewDetailParser.h"
#import "GBMViewDetailModel.h"
@implementation GBMViewDetailParser

- (NSArray *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    
    if (error) {
        NSLog(@"The parser is not work.");
    } else {
        
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            
            id data = [jsonDic valueForKey:@"data"];
            for (id dic in data) {
                GBMViewDetailModel *model = [[GBMViewDetailModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                
                [array addObject:model];
            }
        }
    }
    return array;
}

@end
