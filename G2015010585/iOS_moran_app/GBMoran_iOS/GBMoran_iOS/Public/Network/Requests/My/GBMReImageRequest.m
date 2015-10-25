//
//  GBMReImageRequest.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMReImageRequest.h"
#import "BLMultipartForm.h"
#import "GBMGlobal.h"
@implementation GBMReImageRequest
- (void)sendReNameRequestWithImage:(UIImage *)image delegate:(id<GBMReImageRequestDelegate>)delegate
{
    [self.urlConnection cancel];
    
    self.delegate = delegate;
    
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web//user/avatar";
    
    // POST请求
    NSString *encodeURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:encodeURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 忽略本地和远程的缓存
    NSData *data;
    data = UIImageJPEGRepresentation(image, 0.000001);
    BLMultipartForm *form = [[BLMultipartForm alloc] init];
    [form addValue: [GBMGlobal shareGlobal].user.userId forField:@"user_id"];
    [form addValue:[GBMGlobal shareGlobal].user.token forField:@"token"];
    [form addValue:data forField:@"data"];
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
    NSLog(@"ReImage receive data string:%@", string);
    if ([_delegate respondsToSelector:@selector(reImageRequestSuccess:)]) {
        [_delegate reImageRequestSuccess:self];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@", error);
    if ([_delegate respondsToSelector:@selector(reImageRequestFail:error:)]) {
        [_delegate reImageRequestFail:self error:error];
    }
}
@end
