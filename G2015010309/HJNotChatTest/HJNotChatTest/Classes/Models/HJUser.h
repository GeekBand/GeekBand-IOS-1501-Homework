//
//  HJUser.h
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HJUser : NSObject

@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIImage *headImage;

+ (HJUser *)uerWithID: (NSInteger)uerID
                 name: (NSString *)aName
            headImage: (UIImage *)headImage;

@end
