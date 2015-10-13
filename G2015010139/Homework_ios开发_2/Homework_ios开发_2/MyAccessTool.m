//
//  MyAccessTool.m
//  Homework_ios开发_2
//
//  Created by john on 15/9/30.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MyAccessTool.h"
#import "BLUtility.h"
#import "Classmate.h"
#import "NSString+SHA1.h"

#define CLASSMATES_PLIST_PATH [BLUtility getPathWithinDocumentDir:@"classmates.plist"]
#define IMAGES_PATH(FILENAME) [BLUtility getPathWithinDocumentDir:[NSString stringWithFormat:@"%@", FILENAME]]

NSMutableArray * classmateArray = nil;

@implementation MyAccessTool

+ (NSMutableArray *)getClassmateArray {
    
    
    if (classmateArray == nil) {
        
        classmateArray = [NSMutableArray arrayWithContentsOfFile:CLASSMATES_PLIST_PATH];
        
    }
    
    return classmateArray;
    
}

+ (void)saveClassmateArray {
    
    if (classmateArray != nil) {
        
        [classmateArray writeToFile:CLASSMATES_PLIST_PATH atomically:YES];
    }
}

+ (Classmate *)getClassmateAtIndex:(NSInteger)index {

    NSArray * cArray = [MyAccessTool getClassmateArray];
    
    if (cArray == nil || index >= [cArray count]) {
        
        return nil;
    }
    
    NSDictionary * dic = [cArray objectAtIndex:index];
    
    UIImage * image = [UIImage imageWithContentsOfFile:IMAGES_PATH(dic[@"image"])];
    
    return [[Classmate alloc] initWithImage:image Name:dic[@"name"] Content:dic[@"content"]];
}

+ (NSInteger)getClassmateNumber {
    
    NSArray * cArray = [MyAccessTool getClassmateArray];
    
    if (cArray) {
        
        return [cArray count];
    }
    
    return 0;
}

+ (void)saveClassmate:(Classmate *)classmate {
    
    NSMutableArray * cArray = [MyAccessTool getClassmateArray];
    
    if (cArray == nil) {
        
        classmateArray = [NSMutableArray new];
        
        cArray = classmateArray;
        
    }
    
    NSString * key = [NSNull null];
    
    if (classmate.image != nil) {
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *locationString=[formatter stringFromDate: [NSDate date]];
        
        key = [[NSString stringWithFormat:@"%@ %@", locationString, classmate.name] SHA1];
        
        NSData *pngData = UIImagePNGRepresentation(classmate.image);
        
        [pngData writeToFile:IMAGES_PATH(key) atomically:YES];
    }
    
    
    NSDictionary * dic = @{@"name":classmate.name, @"content":classmate.content, @"image":key};
    
    [cArray addObject:dic];
    
    
}

@end
