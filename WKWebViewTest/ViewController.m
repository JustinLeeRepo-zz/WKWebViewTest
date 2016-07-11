//
//  ViewController.m
//  WKWebViewTest
//
//  Created by Justin Lee on 7/11/16.
//  Copyright © 2016 AppLovin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIWebView *oldCompareWebView;
@property (nonatomic, strong) WKWebViewConfiguration *configuration;

@end

@implementation ViewController

- (WKWebView *)webView
{
    if (!_webView) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        CGRect rect = CGRectMake(0, 0, screen.size.width, screen.size.height / 2);
        _webView = [[WKWebView alloc] initWithFrame:rect configuration:self.configuration];
        
        NSURL *URL = [NSURL URLWithString:@"https://www.applovin.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (WKWebViewConfiguration *)configuration
{
    if (!_configuration) {
        _configuration = [[WKWebViewConfiguration alloc] init];
    }
    return _configuration;
}

- (UIWebView *)oldCompareWebView
{
    if (!_oldCompareWebView) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        CGRect rect = CGRectMake(0, screen.size.height / 2, screen.size.width, screen.size.height / 2);
        _oldCompareWebView = [[UIWebView alloc] initWithFrame:rect];
        
        NSURL *URL = [NSURL URLWithString:@"https://www.applovin.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [_oldCompareWebView loadRequest:request];
    }
    return _oldCompareWebView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.oldCompareWebView];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
