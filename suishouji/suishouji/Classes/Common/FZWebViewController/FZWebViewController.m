//
//  FZWebViewController.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "FZWebViewController.h"

@interface FZWebViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, weak) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation FZWebViewController

#pragma mark - layout

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupWebView];
    [self setupProgressView];
}

- (void)setupWebView {
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    self.webView = webView;
    webView.delegate = self;
}

- (void)setupProgressView {
    UIProgressView *progressView = [UIProgressView new];
    [self.view insertSubview:progressView aboveSubview:self.webView];
    self.progressView = progressView;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.webView.frame = self.view.bounds;
    self.progressView.frame = CGRectMake(0, 0, self.view.frame.size.width, 10);
}

#pragma mark - UIWebView代理方法

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self addProgressTimer];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.webPageCanGoBack = webView.canGoBack;
    [self showFullprogress];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self removeProgressTimer];
}


#pragma mark - 进度条

- (void)addProgressTimer {
    self.progressView.progress = 0.0;
    self.progressView.hidden = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateProgress {
    if (self.progressView.progress < 0.8) {
        [self.progressView setProgress:self.progressView.progress + 0.1 animated:YES];
    }
}

- (void)showFullprogress {
    [self.progressView setProgress:1.0 animated:YES];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeProgressTimer];
    });
}

- (void)removeProgressTimer {
    [self.timer invalidate];
    self.timer = nil;
    self.progressView.hidden = YES;
}

#pragma mark - 对外接口

#pragma mark 设置进度条颜色

- (void)setProgressTintColor:(nonnull UIColor *)progressTintColor {
    self.progressView.progressTintColor = progressTintColor;
}

#pragma mark 加载指定页面

- (void)loadPageWithUrl:(nonnull NSString *)urlString {
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark 页面后退

- (void)goBack {
    if (self.webPageCanGoBack) {
        [self.webView goBack];
    }
}

@end
