//
//  MyRequest.m
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MyRequest.h"



@implementation MyRequest

- (void)RequestWithURL:(NSString *)url Success:(void (^)(id))success Failure:(void (^)(NSError *))failure {
    
    NSString *encodedURLString;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")) {
        
        if (self.task) {
            [self.task cancel];
        }
        
        encodedURLString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *URL = [NSURL URLWithString:encodedURLString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        request.HTTPMethod = @"GET";
        request.timeoutInterval = 60;
        request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        
        NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        self.begin = [[NSDate alloc] init];
        self.task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
            
            self.end= [[NSDate alloc] init];
            
            NSLog(@"task is complete.");
            if (error) {
                failure(error);
            } else {
                NSLog(@"Download succeeds.");
                success(data);
            }
            
        }];
        
        [self.task resume];
        
    } else {
        
        if (self.URLConnection) {
            [self.URLConnection cancel];
        }
        
        encodedURLString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *URL = [NSURL URLWithString:encodedURLString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        request.HTTPMethod = @"GET";
        request.timeoutInterval = 60;
        request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                             delegate:self
                                                     startImmediately:YES];
        
        self.success = success;
        
        self.failure = failure;
    }
    
}

- (NSTimeInterval)DownloadTime {
    
    if (self.end && self.begin && [self.begin compare:self.end] == NSOrderedAscending) {
        
        return [self.end timeIntervalSinceDate:self.begin];
    }
    
    return -1;
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
    self.receivedData = [NSMutableData data];
    self.begin = [[NSDate alloc] init];
    
    if (httpResponse.statusCode == 200) {   // 连接成功
        
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
    
//    BLLoginRequestParser *parser = [[BLLoginRequestParser alloc] init];
//    //    BLUser *user = [parser parseJson:self.receivedData];
//    BLUser *user = [parser parseXML:self.receivedData];
//    if ([_delegate respondsToSelector:@selector(requestSuccess:user:)]) {
//        [_delegate requestSuccess:self user:user];
    
    self.end = [[NSDate alloc] init];
    if (self.success) {
        self.success(self.receivedData);
    }

}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    if (self.failure) {
        self.failure(error);
    }
}



@end
