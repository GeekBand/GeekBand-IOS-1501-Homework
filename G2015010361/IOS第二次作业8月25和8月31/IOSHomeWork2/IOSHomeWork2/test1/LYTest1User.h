//
//  LYTest1User.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYTest1User : NSObject{
    NSString         *_name;
    NSString         *_headImagePath;
    NSString         *_lifePhotoPath;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *headImagePath;
@property (nonatomic, copy) NSString *lifePhotoPath;

+ (LYTest1User *)userWithName:(NSString *)aName
           headImagePath:(NSString *)aHeadImagePath
           lifePhotoPath:(NSString *)aLifePhotoPath;

@end

