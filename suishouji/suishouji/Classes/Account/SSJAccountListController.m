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
    
    [self setupNavItems];
}

- (void)setupNavItems {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"add" highLightImage:nil action:@selector(addNewAccount)];
}

- (void)addNewAccount {
    NSLog(@"enter");
    SSJAddAccountController *dstVc = [SSJAddAccountController new];
    [self.navigationController pushViewController:dstVc animated:YES];
}


@end
