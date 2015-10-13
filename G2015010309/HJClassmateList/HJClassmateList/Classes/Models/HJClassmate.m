//
//  HJClassmate.m
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJClassmate.h"

@implementation HJClassmate

+ (HJClassmate *)classmateWithName: (NSString *)aName
                                classmateId: (NSInteger)classmateID
                           comment: (NSString *)aComment
                         imageInBundle: (BOOL)imageInBundle
                         imageName:(NSString *)imageName {
    HJClassmate *classmate = [[HJClassmate alloc] init];
    classmate.name = aName;
    classmate.classmateID = classmateID;
    classmate.comment = aComment;
    classmate.imageInBundle = imageInBundle;
    classmate.imageName = imageName;
    
    return classmate;
}

@end
