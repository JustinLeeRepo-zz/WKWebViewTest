//
//  ViewController.m
//  WKWebViewTest
//
//  Created by Justin Lee on 7/11/16.
//  Copyright © 2016 AppLovin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIWebView *oldCompareWebView;
@property (nonatomic, strong) WKWebViewConfiguration *configuration;


@end

@implementation ViewController

#pragma mark - Properties

- (WKWebView *)webView
{
    if (!_webView) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        CGRect rect = CGRectMake(0, 0, screen.size.width, screen.size.height);
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

#pragma mark - WKWebView Delegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"navigationAction description : %@", [navigationAction description]);
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    NSLog(@"!!!! navigationResponse description : %@", [navigationResponse description]);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.navigationDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = YES;
    self.webView.allowsLinkPreview = YES;
//    [self.view addSubview:self.oldCompareWebView];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
