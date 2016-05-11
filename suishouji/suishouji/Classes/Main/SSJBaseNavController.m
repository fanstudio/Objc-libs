//
//  SSJBaseNavController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJBaseNavController.h"
#import "UIBarButtonItem+FZExtension.h"
#import "UIImage+FZExtension.h"
#import "FZStyle.h"

@interface SSJBaseNavController ()

@end

@implementation SSJBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBarColor:FZ_BLUE_COLOR];
    [self setupDefsTitleStyle];
}

- (void)setupNavigationBarColor:(UIColor *)color {
    UINavigationBar *navBar = self.navigationBar;
    
    // 设置导航栏的颜色
    UIImage *bgImage = [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
    [navBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    // 去掉默认的分隔线
    UIImage *seperatorImage = [UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)];
    navBar.shadowImage = seperatorImage;
}

#pragma mark - 设置标题风格

- (void)setupDefsTitleStyle {
    // 设置标题的字体和颜色
    NSMutableDictionary *titleAttrs = [NSMutableDictionary dictionary];
    titleAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttrs[NSFontAttributeName] = FONT_TITLE1;
    self.navigationBar.titleTextAttributes = titleAttrs;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"back" highLightImage:nil action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}



@end
