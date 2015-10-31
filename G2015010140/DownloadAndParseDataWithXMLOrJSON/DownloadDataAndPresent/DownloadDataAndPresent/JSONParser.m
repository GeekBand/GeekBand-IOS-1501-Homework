//
//  JSONParser.m
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

- (NSArray *)parseAJSONData:(NSData *)data {
    NSError *error = nil;
    GameAttributes *gameAttributes;
    NSMutableArray *rawData = [NSMutableArray array];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    
    dictionary = [dictionary objectForKey:@"feed"];
    (void)[Author authorWithADictionary:[dictionary objectForKey:@"author"]];
    NSArray *games = [dictionary objectForKey:@"entry"];
    for (NSDictionary *dic in games) {
        if ([[dic objectForKey:@"im:name"] isKindOfClass:[NSDictionary class]]) {
            gameAttributes = [[GameAttributes alloc] init];
            gameAttributes.name = [[dic objectForKey:@"im:name"] objectForKey:@"label"];
        }
        if ([[dic objectForKey:@"im:image"] isKindOfClass:[NSArray class]] && [[[dic objectForKey:@"im:image"] objectAtIndex:1] isKindOfClass:[NSDictionary class]]) {
            NSString *imageAddress = [[[dic objectForKey:@"im:image"] objectAtIndex:1] objectForKey:@"label"];
            gameAttributes.imageAddress = imageAddress;
        }
        if (gameAttributes != nil) {
            [rawData addObject:gameAttributes];
            gameAttributes = nil;
        }
    }
    return [rawData copy];
}

@end
