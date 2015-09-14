//
//  BLLoginRequest.m
//  Xcode_learn
//
//  Created by house on 15/8/14.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "BLLoginRequest.h"
#import "BLMultipartForm.h"
#import "BLLoginRequestParser.h"
@interface BLLoginRequest () <NSURLConnectionDataDelegate>

@end

@implementation BLLoginRequest
-(void)sendLoginRequestWithUserName:(NSString *)userName password:(NSString *)password delegate:(id<BLLoginRequestDelegate>)delegate{

    self.delegate =delegate;
    [self.connection cancel];
    
//    GET
//    NSString *urlString=@"http://localhost/login.json";
//    urlString=[NSString stringWithFormat:@"%@?username=%@&password=%@",urlString,userName,password];
//    NSString *encodeString =[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *urltest = [NSURL URLWithString:encodeString];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urltest];
////   采用 NSMutableURLRequest可以修改method、超时等属性，而用NSURLRequest不能设置
//    
//    request.HTTPMethod = @"GET";
//    request.timeoutInterval = 60;
//    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
//    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
//    POST
     NSString *urlString=@"http://localhost/net/login.xml";

    NSString *encodeString =[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *urltest = [NSURL URLWithString:encodeString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urltest];
    request.HTTPMethod=@"POST";
    BLMultipartForm *form = [[BLMultipartForm alloc]init];
    [form addValue:userName forField:@"userName"];
    [form addValue:password forField:@"password"];
    request.HTTPBody =[form httpBody];
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
}
-(void)cancelRequest{
    if (self.connection) {
        [ self.connection cancel];
        self.connection = nil;
    }
}

#pragma remark --- NSURLConnectionDataDelegate
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSString *resultStr= [[NSString alloc ]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    
    BLLoginRequestParser *parser = [[BLLoginRequestParser alloc]init];
//    LUser *user = [parser parserJson:self.receiveData];
      LUser *user = [parser parserXML:self.receiveData];
     NSLog(@"recive:%@",resultStr);
    
    
    if ([_delegate respondsToSelector:@selector(loginRequestSuccess:user:)]) {
        [_delegate loginRequestSuccess:self user:user];
    }
    
    

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    response.
    
//    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;

    NSHTTPURLResponse *tresponse = (NSHTTPURLResponse *)response;
    if (tresponse.statusCode ) {
        self.receiveData = [NSMutableData data];
    }else{
    
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.receiveData appendData:data];

}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
     NSLog(@"%@", error);
    
    if ([_delegate respondsToSelector:@selector(loginRequestError:error:)]) {
        [_delegate loginRequestError:self error:error];
    }
}

@end
