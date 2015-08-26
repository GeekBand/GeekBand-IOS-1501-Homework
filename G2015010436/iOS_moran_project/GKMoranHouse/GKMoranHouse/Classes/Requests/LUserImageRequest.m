//
//  LUserImageRequest.m
//  Xcode_learn
//
//  Created by house on 15/8/16.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "LUserImageRequest.h"

@implementation LUserImageRequest

-(void)downLoadWithUrl:(NSString *)url delegate:(id<LUserImageRequestDelegate>)delagate{
    [self cancel];
    self.delegate = delagate;
    
    NSString *encodeString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *urlString = [NSURL URLWithString:encodeString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:urlString];
    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    
}
-(void)cancel{

    if (self.connection) {
        [self.connection cancel];
    }
    self.connection = nil;
}
#pragma remark ----NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)response;
    if (httpUrlResponse.statusCode == 200) {
        self.totalLength = httpUrlResponse.expectedContentLength;
//        self.totalLength = httpURLResponse.expectedContentLength;
        self.receiveData = [NSMutableData data];
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.receiveData appendData:data];
    if ([_delegate respondsToSelector:@selector(downloadReceivedData:)]) {
        [_delegate downloadReceivedData:self];
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

    if ([_delegate respondsToSelector:@selector(downloadError:error:)]) {
        
        [_delegate downloadError:self error:error];
    }
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if ([_delegate respondsToSelector:@selector(downloadSuccess:data:)]) {
        
        [_delegate downloadSuccess:self data:self.receiveData];
    }
}

@end
