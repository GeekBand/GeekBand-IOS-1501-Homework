//
//  Author.m
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "Author.h"

@implementation Author

static dispatch_once_t onceToken;
static Author *author = nil;

+ (id)hiddenAlloc {
    return [super alloc];
}

+ (Author *)authorWithADictionary:(NSDictionary *)dictionary {
    dispatch_once(&onceToken, ^{
        author = [[self hiddenAlloc] init];
    });
    author.name = [[dictionary objectForKey:@"name"] objectForKey:@"label"];
    author.uri = [[dictionary objectForKey:@"uri"] objectForKey:@"label"];
    return author;
}

+ (Author *)sharedAuthor {
    dispatch_once(&onceToken, ^{
        author = [[self hiddenAlloc] init];
    });
    return author;
}

+ (id)alloc {
    NSLog(@"This is a singleton: %@", [self class]);
    return nil;
}


+ (id)new {
    return [self alloc];
}

@end
