//
//  WebRequest.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONOrXMLControlMacro.h"

@protocol WebRequestDelegate <NSObject>

- (void)handleReceivedData:(NSData *) data;
- (void)handleImageData:(NSData *) data;

@end

@interface WebRequest : NSObject<NSURLConnectionDataDelegate>

@property (weak, nonatomic)id<WebRequestDelegate> delegate;

- (void)startARequestWithURL:(NSURL *)url;

@end
