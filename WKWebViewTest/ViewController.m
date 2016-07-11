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

@end

@implementation ViewController

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        NSURL *URL = [NSURL URLWithString:@"https://www.applovin.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        [_webView loadRequest:request];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
