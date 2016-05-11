//
//  FZMenuController.m
//  test
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "FZMenuController.h"
#import "UIView+Layout.h"

@interface FZMenuController ()

@property (nonatomic, weak) UIViewController *menuVc;
@property (nonatomic, weak) UIViewController *contentVc;
@property (nonatomic, assign) CGFloat leftWidthScale;

@end

@implementation FZMenuController

- (instancetype)initWithMenuVc:(UIViewController *)menuVc
                     contentVc:(UIViewController *)contentVc
                leftWidthScale:(CGFloat)leftWidthScale {
    if (self = [super init]) {
        [self addChildViewController:menuVc];
        [self addChildViewController:contentVc];
        self.menuVc = menuVc;
        self.contentVc = contentVc;
        self.leftWidthScale = leftWidthScale;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.menuVc.view];
    [self.view addSubview:self.contentVc.view];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(onGestureMove:)];
    [self.view addGestureRecognizer:pan];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat menuWidth = self.leftWidthScale * self.view.width;
    self.menuVc.view.frame = CGRectMake(-menuWidth, 0, menuWidth, self.view.height);
    self.contentVc.view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
}

- (void)onGestureMove:(UIPanGestureRecognizer *)pan {
    CGPoint translation = [pan translationInView:pan.view]; // 1.取出每次挪动的距离
    [self stepMoveViewByX:translation.x];                   // 2.轻移
    [pan setTranslation:CGPointZero inView:pan.view];       // 3.清空累计
    
    if (pan.state != UIGestureRecognizerStateEnded) return;
    
    // 4.手势结束，判断是否移出超过一半，展开或收起。
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        
        if (weakSelf.contentVc.view.x > weakSelf.menuVc.view.width * 0.5) {
            weakSelf.contentVc.view.x = weakSelf.menuVc.view.width;
            weakSelf.menuVc.view.x = 0;
        } else {
            weakSelf.contentVc.view.x = 0;
            weakSelf.menuVc.view.x = -weakSelf.menuVc.view.width;
        }

    }];
}

- (void)stepMoveViewByX:(CGFloat)x {
    if (x > 0 && (x + self.menuVc.view.x) <= 0) {
        self.menuVc.view.x += x;
        self.contentVc.view.x += x;
    }
    
    if (x < 0 && (x + self.contentVc.view.x) > 0) {
        self.menuVc.view.x += x;
        self.contentVc.view.x += x;
    }
}

- (void)showOrHideMenuView {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        if (weakSelf.contentVc.view.x) {
            weakSelf.contentVc.view.x = 0;
            weakSelf.menuVc.view.x = -weakSelf.menuVc.view.width;
        } else {
            weakSelf.contentVc.view.x = weakSelf.menuVc.view.width;
            weakSelf.menuVc.view.x = 0;
        }
    }];
}

@end
