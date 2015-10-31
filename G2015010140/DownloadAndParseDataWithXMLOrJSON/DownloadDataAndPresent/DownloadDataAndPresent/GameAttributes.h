//
//  GameAttributes.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/10/30.
//  Copyright © 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameAttributes : NSObject

@property (copy, nonatomic)NSString *imageAddress;
@property (copy, nonatomic)NSString *name;
@property (strong, nonatomic)UIImage *image;

@end
