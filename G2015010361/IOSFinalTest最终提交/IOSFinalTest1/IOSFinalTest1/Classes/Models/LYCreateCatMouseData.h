//
//  LYCreateCatMouseData.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/13.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cat.h"
#import "mouse.h"
@interface LYCreateCatMouseData : NSObject{
    NSMutableArray      *_messageArray;
    //NSMutableArray      *_messageArray2;

}

- (void)createMessageData;

@end
