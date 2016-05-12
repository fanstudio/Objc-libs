//
//  WelComeViewController.m
//  suishouji
//
//  Created by 张帆 on 16/5/10.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "WelComeViewController.h"
#import "SSJBaseController.h"
#import "SSJSkipWelcomeView.h"
#import "FZStyle.h"
#import "UIView+Layout.h"
#import <QuartzCore/QuartzCore.h>

@interface WelComeViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *welcomeImageView;
@property (nonatomic, weak) SSJSkipWelcomeView *skipWelcomeView;

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    [self setupWelcomeImageView];
    [self setupSkipWelcomeView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self animationZoomBigImage];
}

- (void)setupScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.delegate = self;
    scrollView.maximumZoomScale = 1.5;
}

- (void)setupWelcomeImageView {
    UIImageView *welcomeImageView = [UIImageView new];
    [self.scrollView addSubview:welcomeImageView];
    self.welcomeImageView = welcomeImageView;
    welcomeImageView.image = [UIImage imageNamed:@"lauchImage"];
    welcomeImageView.userInteractionEnabled = YES;
}

- (void)setupSkipWelcomeView {
    SSJSkipWelcomeView *skipWelcomeView = [SSJSkipWelcomeView welcomeView];
    [self.view addSubview:skipWelcomeView];
    self.skipWelcomeView = skipWelcomeView;
    [skipWelcomeView.actionButton addTarget:self action:@selector(endAnimation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews {
    self.scrollView.frame = self.view.bounds;
    self.welcomeImageView.frame = self.scrollView.bounds;
    self.skipWelcomeView.frame = CGRectMake(0, self.view.height - 80, self.view.width, 80);
}

#pragma mark - UIScrollViewDelegate

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.welcomeImageView;
}

#pragma mark - 动画放大图片,中断或结束时跳过欢迎界面

- (void)animationZoomBigImage {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:5.0 animations:^{
        weakSelf.scrollView.zoomScale = weakSelf.scrollView.maximumZoomScale;
    } completion:^(BOOL finished) {
        UIWindow *wnd = [UIApplication sharedApplication].windows.lastObject;
        wnd.rootViewController = [SSJBaseController new];
    }];
}

#pragma mark - 强制超过，这里会引发结束动画

- (void)endAnimation {
    [self.scrollView removeFromSuperview];
}


@end
