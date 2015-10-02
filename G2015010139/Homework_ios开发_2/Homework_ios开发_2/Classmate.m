//
//  Classmate.m
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "Classmate.h"

@implementation Classmate

- (instancetype)initWithImage:(UIImage *)image Name:(NSString *)name Content:(NSString *)content {
    
    if (self = [super init]) {
        
        self.image = image;
        self.name = name;
        self.content = content;
    }
    
    return self;
}

+ (NSArray *)keysForCoding {
    
    return @[@"image", @"name", @"content"];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    for (NSString * key in [Classmate keysForCoding]) {
        
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        for (NSString * key in [Classmate keysForCoding]) {
            
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    
    return self;
    
}

@end
