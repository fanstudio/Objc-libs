//
//  AppDelegate.m
//  test
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "AppDelegate.h"
#import "FZMenuController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[FZMenuController alloc] initWithMenuVc:[LeftViewController new] contentVc:[RightViewController new] leftWidthScale:0.45];
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
