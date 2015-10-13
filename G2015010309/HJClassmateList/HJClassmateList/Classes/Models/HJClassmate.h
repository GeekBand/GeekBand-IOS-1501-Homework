//
//  HJClassmate.h
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJClassmate : NSObject

@property (nonatomic, assign) NSInteger classmateID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, assign) BOOL imageInBundle;
@property (nonatomic, copy) NSString *imageName;

+ (HJClassmate *)classmateWithName: (NSString *)aName
                                classmateId: (NSInteger)classmateID
                           comment: (NSString *)aComment
                     imageInBundle: (BOOL)imageInBundle
                         imageName: (NSString *)imageName;

@end
