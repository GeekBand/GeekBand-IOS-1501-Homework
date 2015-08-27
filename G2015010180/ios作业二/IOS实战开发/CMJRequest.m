//
//  CMJRequest.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "CMJRequest.h"
#import "BLMultipartForm.h"
#import "CMJRequestParser.h"
#import "CMJUser.h"
@interface CMJRequest()<NSURLConnectionDataDelegate>

@end


@implementation CMJRequest


-(void)sendLoginRequestWithdelegate:(id<CMJRequestDelegate>)delegate{
    
    [self.URLConnection cancel];
    self.delegate = delegate;
    NSString *URLString = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json";
    NSString *encodedURLString
    = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:encodedURLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
        request.timeoutInterval = 60;
        request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    BLMultipartForm *form = [[BLMultipartForm alloc] init];
    request.HTTPBody = [form httpBody];
    self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

- (void)cancelRequest
{
    if (self.URLConnection) {
        [self.URLConnection cancel];
        self.URLConnection = nil;
    }
}


#pragma mark - NSURLConnectionDataDelegate methods

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {   // 连接成功
        self.receivedData = [NSMutableData data];
    }else {
        // 请求错误，错误处理。
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivedData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
//
    CMJRequestParser *parser = [[CMJRequestParser alloc] init];
    //    BLUser *user = [parser parseJson:self.receivedData];
    self.user = [parser parseJson:self.receivedData];
    if ([_delegate respondsToSelector:@selector(requestSuccess:user:)]) {
        [_delegate requestSuccess:self user:self.user];
    }
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    if ([_delegate respondsToSelector:@selector(requestFailed:error:)]) {
        [_delegate requestFailed:self error:error];
    }
}



@end
