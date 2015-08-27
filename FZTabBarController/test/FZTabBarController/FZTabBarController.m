//
//  FZTabBarController.m
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import "FZTabBarController.h"
#import "FZTabBar.h"

@interface FZTabBarController () <FZTabBarDelegate>

@property (nonatomic, weak) FZTabBar *costomTabBar;

@end

@implementation FZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

    // 自定义导航栏
    [self setupCustomTabBar];
    
}

- (void)setupCustomTabBar {
    FZTabBar *costomTabBar = [[FZTabBar alloc] initWithFrame:self.tabBar.bounds];
    costomTabBar.delegate = self;

    [self.tabBar addSubview:costomTabBar];
    self.costomTabBar = costomTabBar;
}


- (void)addChildVC:(UIViewController *)childController title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    static NSUInteger idx = 0;
    
    [self.costomTabBar addItemTitle:title normalImage:normalImage selectedImage:selectedImage tag:idx++];
    [self addChildViewController:childController];
#warning 下面这句一定不能删，否则占了没有反应
    childController.tabBarItem.enabled = NO;
}

#pragma mark - FZTabBarDelegate
- (void)tabBar:(FZTabBar *)tabBar didSelected:(NSUInteger)tag {
    self.selectedIndex = tag;
}

@end
