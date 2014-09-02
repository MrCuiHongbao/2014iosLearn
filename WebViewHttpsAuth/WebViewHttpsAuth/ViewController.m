//
//  ViewController.m
//  WebViewHttpsAuth
//
//  Created by zhangliang on 14-9-2.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, NSURLConnectionDelegate>
@property (nonatomic, retain) UIWebView * mwebview;
@property (nonatomic, assign) BOOL authed;
@end

@implementation ViewController
@synthesize mwebview;

- (void)dealloc
{
    [mwebview stopLoading];
    mwebview.delegate = nil;
    [mwebview release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mwebview = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 50, 320, 400)] autorelease];
    self.mwebview.delegate = self;
    [self.view addSubview:self.mwebview];
    
    [self.mwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/wo/11.0.0.11.5.0.7.3.3.1.0.21.2.0.1.3.1"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType

{
    NSString* scheme = [[request URL] scheme];
    NSLog(@"scheme = %@",scheme);
    NSLog(@"resourceSpecifier = %@", [[request URL] resourceSpecifier]);
    //判断是不是https
    if ([scheme isEqualToString:@"https"])
    {
        if (self.authed)
        {
            return YES;
        }
        
        NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/wo/11.0.0.11.5.0.7.3.3.1.0.21.2.0.1.3.1"]] delegate:self];
        [conn start];
        [webView stopLoading];
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge previousFailureCount]== 0)
    {
        _authed = YES;
        //NSURLCredential 这个类是表示身份验证凭据不可变对象。凭证的实际类型声明的类的构造函数来确定。
        NSURLCredential* cre = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        [challenge.sender useCredential:cre forAuthenticationChallenge:challenge];
    }
}

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    self.authed = YES;
    //webview 重新加载请求。
    [self.mwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/wo/11.0.0.11.5.0.7.3.3.1.0.21.2.0.1.3.1"]]];
    [connection cancel];
}

@end
