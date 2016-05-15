//
//  AppDelegate.m
//  suishouji
//
//  Created by 张帆 on 16/5/10.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "AppDelegate.h"
#import "WelComeViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WeiboSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setDefaultWindowAndController];
    [self registerOtherLoginSdk];

    return YES;
}


#pragma mark - 程序启动入口


- (void)setDefaultWindowAndController {
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
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [WelComeViewController new];
    [self.window makeKeyAndVisible];
}

#pragma mark - 第三方登录

- (void)registerOtherLoginSdk {
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     */
    
    NSString *appKey = @"12c9d0501f2f3";
    NSArray *ativePlatorms = @[@(SSDKPlatformTypeSinaWeibo)];
    
    __weak typeof(self) weakSelf = self;
    [ShareSDK registerApp:appKey activePlatforms:ativePlatorms onImport:^(SSDKPlatformType platformType) {
        [weakSelf doOtherLoginImport:platformType];
     } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
         [weakSelf doOtherLoginConfigure:platformType appInfo:appInfo];
     }];

}

- (void)doOtherLoginImport:(SSDKPlatformType) platformType {
    switch (platformType) {
        case SSDKPlatformTypeSinaWeibo:
            [ShareSDKConnector connectWeibo:[WeiboSDK class]];
            break;
        default:
            break;
    }
}

- (void)doOtherLoginConfigure:(SSDKPlatformType)platformType appInfo:(NSMutableDictionary *)appInfo {
    switch (platformType) {
        case SSDKPlatformTypeSinaWeibo:
            //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
            [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                      appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                    redirectUri:@"http://www.sharesdk.cn"
                                       authType:SSDKAuthTypeBoth];
            break;
            
        default:
            break;
    }
}

@end
