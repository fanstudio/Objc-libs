//
//  SSJBaseController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJBaseController.h"
#import "SSJSettingMenuController.h"
#import "SSJAccountListController.h"
#import "SSJBaseNavController.h"

@interface SSJBaseController ()

@end

@implementation SSJBaseController

- (instancetype)init {
    UIViewController *menuVc = [SSJSettingMenuController new];
    UIViewController *contentVc = [[SSJBaseNavController alloc] initWithRootViewController:[SSJAccountListController new]];
    return [super initWithMenuVc:menuVc contentVc:contentVc leftWidthScale:0.45];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
