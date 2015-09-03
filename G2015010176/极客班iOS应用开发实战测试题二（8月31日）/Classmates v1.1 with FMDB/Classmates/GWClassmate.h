//
//  GWClassmate.h
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWClassmate : NSObject

@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSData   *avatar;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *info;

@end

