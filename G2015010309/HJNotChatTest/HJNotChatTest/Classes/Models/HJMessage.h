//
//  HJMessage.h
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJUser.h"

@interface HJMessage : NSObject

@property (nonatomic, strong) HJUser *sender;
@property (nonatomic, copy) NSString *text;

+ (HJMessage *)messageWithSender:(HJUser *)aSender
                            text: (NSString *)aText;

@end
