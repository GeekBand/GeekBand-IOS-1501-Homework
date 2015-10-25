//
//  GBMReNameRequest.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMReNameRequest.h"
#import "BLMultipartForm.h"
#import "GBMGlobal.h"
@implementation GBMReNameRequest

- (void)sendReNameRequestWithName:(NSString *)name delegate:(id<GBMReNameRequestDelegate>)delegate
{
    [self.urlConnection cancel];
    
    self.delegate = delegate;
    
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web//user/rename";
    
    // POST请求
    NSString *encodeURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:encodeURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 忽略本地和远程的缓存
    
    //    NSData *data1 = [request HTTPBody];
    
    BLMultipartForm *form = [[BLMultipartForm alloc] init];
    [form addValue: [GBMGlobal shareGlobal].user.userId forField:@"user_id"];
    [form addValue:[GBMGlobal shareGlobal].user.token forField:@"token"];
    [form addValue:name forField:@"new_name"];
    request.HTTPBody = [form httpBody];
    [request setValue:form.contentType forHTTPHeaderField:@"Content-Type"];
    
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

#pragma mark - 网络请求代理方法

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivedData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.receivedData = [NSMutableData data];
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"ReName data string:%@", string);
    if ([_delegate respondsToSelector:@selector(renameRequestSuccess:)]) {
        [_delegate renameRequestSuccess:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@", error);
    if ([_delegate respondsToSelector:@selector(renameRequestFail:error:)]) {
        [_delegate renameRequestFail:self error:error];
    }
}
@end