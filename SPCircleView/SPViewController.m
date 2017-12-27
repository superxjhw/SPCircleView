//
//  SPViewController.m
//  SPCircleView
//
//  Created by YJTSuper on 2017/12/27.
//  Copyright © 2017年 YJTSuper. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "SPViewController.h"


@interface SPViewController ()<WKNavigationDelegate>

@property (nonatomic, weak) WKWebView *webView;
@property (nonatomic, weak) UIProgressView *progressView;

@end

@implementation SPViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWebView];
    [self initProgressView];
    
    
}


#pragma mark- initView
- (void)initWebView {
    
    WKWebView *webView = [[WKWebView alloc] init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.openUrlString]]];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    webView.allowsBackForwardNavigationGestures = YES;
    webView.navigationDelegate = self;
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    self.webView = webView;
}



- (void)initProgressView {
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 100)];
    progressView.progressTintColor = [UIColor orangeColor];
    progressView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progressView];
    self.progressView = progressView;
}




- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    self.title = webView.title;
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        [self.progressView setProgress:[change[NSKeyValueChangeNewKey] floatValue] animated:YES];
        if (self.progressView.progress == 1) {
            self.progressView.hidden = YES;
            self.progressView.progress = 0;
        }else {
            self.progressView.hidden = NO;
        }
        
    }
    
}


- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
