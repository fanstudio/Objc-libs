//
//  AppDelegate.m
//  suishouji
//
//  Created by 张帆 on 16/5/10.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "AppDelegate.h"
#import "WelComeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/*
 程序结构介绍
 AppDelegate ->WelComeViewController(欢迎界面)
 ->SSJBaseController(主体结构控制器，左右菜单分栏，它继承于自定义的FZMenuController)
 ==>SSJSettingMenuController（左侧菜单内容）
 ==>SSJBaseNavController + SSJBaseContentViewController （右侧实际内容）
 ===》SSJBaseNavController，内容控制器通常使用自定义的导航控制器来包裹，为方便统一设置，定义此类
 ===》SSJBaseContentViewController，具体的内容控制器父类，有时候可能需要统一设置导航栏，以及禁止滑出菜单
 
 注意，右侧内容这里提供的是一个模板，实际可以不是这个组合，具体可参见SSJSettingMenuController内容的切换。
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [WelComeViewController new];
    [self.window makeKeyAndVisible];

    return YES;
}



@end
