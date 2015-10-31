//
//  WebRequest.m
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "WebRequest.h"

@interface WebRequest () {
    NSMutableData *_data;
}

@end

@implementation WebRequest

- (void)startARequestWithURL:(NSURL *)url {
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60] delegate:self startImmediately:NO];
    
    [connection start];
    
}

#pragma mark - NSURLConnectionDataDelegate methods

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_data appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
    if (httpURLResponse.statusCode == 200) {
        _data = [NSMutableData data];
    }
    if (httpURLResponse.statusCode >= 400 && httpURLResponse.statusCode < 500) {
        NSLog(@"连接失败...");
    }
    if (httpURLResponse.statusCode >= 500) {
        NSLog(@"服务器出错...");
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if ([[connection.currentRequest.URL absoluteString] isEqualToString:LOADING_URL]) {
        [_delegate handleReceivedData:[_data copy]];
    }else {
        [_delegate handleImageData:[_data copy]];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}


@end
