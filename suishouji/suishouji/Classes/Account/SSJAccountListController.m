//
//  SSJAccountListController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJAccountListController.h"
#import "SSJBaseController.h"


@implementation SSJAccountListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavItems];
}

- (void)setupNavItems {
    self.navigationItem.title = @"账号列表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewAccount)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(showOrHideMenu)];
}

- (void)showOrHideMenu {
    if ([self.navigationController.parentViewController isKindOfClass:SSJBaseController.class]) {
        SSJBaseController *menuVc = (SSJBaseController *)self.navigationController.parentViewController;
        [menuVc showOrHideMenuView];
    }
}

- (void)addNewAccount {
    NSLog(@"enter");
}
@end
