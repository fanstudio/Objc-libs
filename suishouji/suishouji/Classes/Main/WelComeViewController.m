//
//  WelComeViewController.m
//  suishouji
//
//  Created by 张帆 on 16/5/10.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "WelComeViewController.h"
#import "SSJBaseController.h"

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
    welComeLabel.font = [UIFont boldSystemFontOfSize:22.0];
    welComeLabel.textColor = [UIColor whiteColor];
    welComeLabel.text = @"    随手记，你身边的密码管家";
    welComeLabel.numberOfLines = 0;
    welComeLabel.layer.borderWidth = 1.0;
    welComeLabel.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)viewWillLayoutSubviews {
    //
    self.scrollView.frame = self.view.bounds;
    //
    self.welcomeImageView.frame = self.scrollView.bounds;
    
    //
    CGFloat padding = 20;
    CGFloat width = self.view.frame.size.width - 2 * padding;
    CGFloat height = 60;
    CGFloat y = self.view.frame.size.height * 0.35;
    self.welComeLabel.frame = CGRectMake(padding, y, width, height);
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.welcomeImageView;
}

- (void)zoomShow {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:2.0 animations:^{
        weakSelf.scrollView.zoomScale = weakSelf.scrollView.maximumZoomScale;
    } completion:^(BOOL finished) {
        UIWindow *wnd = [UIApplication sharedApplication].windows.lastObject;
        wnd.rootViewController = [SSJBaseController new];
    }];
}



@end
