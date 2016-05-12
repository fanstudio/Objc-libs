//
//  WelComeViewController.m
//  suishouji
//
//  Created by 张帆 on 16/5/10.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "WelComeViewController.h"
#import "SSJBaseController.h"
#import "FZStyle.h"
#import "UIView+Layout.h"

@interface WelComeViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *welcomeImageView;
@property (nonatomic, weak) UILabel *welComeLabel;

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    [self setupWelcomeImageView];
    [self setupWelcomeLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self zoomShow];
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

- (void)setupWelcomeLabel {
    UILabel *welComeLabel = [UILabel new];
    [self.view addSubview:welComeLabel];
    self.welComeLabel = welComeLabel;
    welComeLabel.font = [UIFont systemFontOfSize:20.0];
    welComeLabel.textColor = [UIColor whiteColor];
    welComeLabel.text = @"    随手记，我自己的密码管家......";
    welComeLabel.backgroundColor = FZ_COVER_COLOR;
}

- (void)viewWillLayoutSubviews {
    //
    self.scrollView.frame = self.view.bounds;
    //
    self.welcomeImageView.frame = self.scrollView.bounds;
    
    //
    self.welComeLabel.frame = CGRectMake(0, self.view.height - 80, self.view.width, 80);
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.welcomeImageView;
}

- (void)zoomShow {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:5.0 animations:^{
        weakSelf.scrollView.zoomScale = weakSelf.scrollView.maximumZoomScale;
    } completion:^(BOOL finished) {
        UIWindow *wnd = [UIApplication sharedApplication].windows.lastObject;
        wnd.rootViewController = [SSJBaseController new];
    }];
}



@end
