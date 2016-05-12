//
//  SSJAccountListController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJAccountListController.h"
#import "SSJBaseController.h"
#import "SSJAddAccountController.h"
#import "UIBarButtonItem+FZExtension.h"
#import "FZStyle.h"


@implementation SSJAccountListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FZ_VIEW_COLOR;
    [self setupNavItems];
}

- (void)setupNavItems {
    self.navigationItem.title = @"账号列表";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"Category" highLightImage:nil action:@selector(showOrHideMenu)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"add" highLightImage:nil action:@selector(addNewAccount)];
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

- (void)addNewAccount {
    NSLog(@"enter");
    SSJAddAccountController *dstVc = [SSJAddAccountController new];
    [self.navigationController pushViewController:dstVc animated:YES];
}


@end
