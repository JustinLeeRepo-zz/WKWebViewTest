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
//        [_webView loadRequest:request];
        NSString *html = @"<html><head><title></title></head><body><h1>YOYO THIS IS A TEST</h1><p>THIS IS A PARAGRAPH TESTER</p><p>MY SECOND PARAGRAPH TESTER</p><h6><p>THIRD PARAGRAPH TESTER WITH SMALL HEADING</p></h6><a href='http://www.google.com'>YO THIS IS A LINK</a><a href='http://www.dogbreedinfo.com/pomchi.htm'><img src='http://www.dogbreedinfo.com/images29/PomchiPomeranianChihuahuaMixBreedDogCooper2YearsOld.jpg'/></a></body></html>";
        [_webView loadHTMLString:html baseURL:nil];
        
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
    switch (navigationAction.navigationType) {
        case WKNavigationTypeLinkActivated:
            decisionHandler(WKNavigationActionPolicyAllow);
            NSLog(@"OH YEAH THIS IS A LINK");
            [self.webView loadRequest:navigationAction.request];
            break;
            
        case WKNavigationTypeOther:
            decisionHandler(WKNavigationActionPolicyAllow);
            NSLog(@"Navigation is taking place for some OTHER reason...");
            
        default:
            break;
    }
    NSLog(@"navigationAction description : %@", [navigationAction description]);
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
