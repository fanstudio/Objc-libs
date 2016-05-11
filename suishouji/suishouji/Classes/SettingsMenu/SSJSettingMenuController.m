//
//  SSJSettingMenuController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJSettingMenuController.h"
#import "UIView+Layout.h"

@interface SSJSettingMenuController ()

@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, weak) UIScrollView *contentView;
@property (nonatomic, weak) UIView *footerView;

@end

@implementation SSJSettingMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHeaderView];
    [self setupContentView];
    [self setupFooterView];
    [self setupOptionItems];
}

- (void)setupHeaderView {
    UIView *headerView = [UIView new];
    [self.view addSubview:headerView];
    self.headerView = headerView;
    headerView.backgroundColor = [UIColor grayColor];
}

- (void)setupContentView {
    UIScrollView *contentView = [UIScrollView new];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.pagingEnabled = YES;
    contentView.backgroundColor = [UIColor darkGrayColor];
}

- (void)setupFooterView {
    UIView *footerView = [UIView new];
    [self.view addSubview:footerView];
    self.footerView = footerView;
    footerView.backgroundColor = [UIColor grayColor];
}

- (void)setupOptionItems {
    for (NSInteger idx = 0; idx < 25; idx++) {
        [self addItemWithText:@"账号列表" image:nil];
    }
}

- (void)addItemWithText:(NSString *)text image:(NSString *)image {
    UIButton *btn = [UIButton new];
    [self.contentView addSubview:btn];
    [btn setTitle:text forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat headerHeight = 100;
    self.headerView.frame = CGRectMake(0, 0, self.view.width, headerHeight);
    
    CGFloat footerHeight = 44;
    self.footerView.frame = CGRectMake(0, self.view.height - footerHeight, self.view.width, footerHeight);
    
    CGFloat contentHeight = self.view.height - headerHeight - footerHeight;
    self.contentView.frame = CGRectMake(0, headerHeight, self.view.width, contentHeight);
    
    NSInteger idx = 0;
    CGFloat height = 44;
    for (UIView *view in self.contentView.subviews) {
        if (![view isKindOfClass:UIButton.class]) return;
        view.frame = CGRectMake(0, idx * height, self.contentView.width, height);
        idx++;
    }
    
    self.contentView.contentSize = CGSizeMake(0, idx * height);
}


@end
