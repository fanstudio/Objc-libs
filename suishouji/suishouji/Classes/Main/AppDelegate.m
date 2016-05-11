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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [WelComeViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
