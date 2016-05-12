//
//  SSJBaseContentViewController.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJBaseContentViewController.h"
#import "SSJBaseController.h"
#import "UIBarButtonItem+FZExtension.h"
#import "FZStyle.h"

@interface SSJBaseContentViewController ()

@end

@implementation SSJBaseContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZ_VIEW_COLOR;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"Category" highLightImage:nil action:@selector(showOrHideMenu)];
}

#pragma mark - 事件处理

- (void)showOrHideMenu {
    if ([self.navigationController.parentViewController isKindOfClass:SSJBaseController.class]) {
        SSJBaseController *menuVc = (SSJBaseController *)self.navigationController.parentViewController;
        [menuVc showOrHideMenuView];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self.navigationController.parentViewController isKindOfClass:SSJBaseController.class]) {
        SSJBaseController *menuVc = (SSJBaseController *)self.navigationController.parentViewController;
        menuVc.hideMenuEnable = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self.navigationController.parentViewController isKindOfClass:SSJBaseController.class]) {
        SSJBaseController *menuVc = (SSJBaseController *)self.navigationController.parentViewController;
        menuVc.hideMenuEnable = YES;
    }
}

@end
