//
//  SSJAboutMeController.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJAboutMeController.h"


@interface SSJAboutMeController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation SSJAboutMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    self.webView = webView;
    
    NSURL *url = [NSURL URLWithString:@"http://www.mionsoft.com"];
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:reqest];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.webView.frame = self.view.bounds;
}





@end
