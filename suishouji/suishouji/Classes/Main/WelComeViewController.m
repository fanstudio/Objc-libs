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
//    [skipWelcomeView.actionButton addTarget:self action:@selector(onSkipWelCome) forControlEvents:UIControlEventTouchUpInside];
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

#pragma mark - 动画放大图片

- (void)animationZoomBigImage {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:5.0 animations:^{
        weakSelf.scrollView.zoomScale = weakSelf.scrollView.maximumZoomScale;
        FZTrace;
    } completion:^(BOOL finished) {
        [weakSelf onSkipWelCome];
    }];
}

#pragma mark - 跳过欢迎界面

- (void)onSkipWelCome {
    UIWindow *wnd = [UIApplication sharedApplication].windows.lastObject;
    wnd.rootViewController = [SSJBaseController new];
}


@end
