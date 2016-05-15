//
//  SSJDoLoginController.m
//  suishouji
//
//  Created by 张帆 on 16/5/15.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJDoLoginController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WeiboSDK.h"

@interface SSJDoLoginController ()

@end

@implementation SSJDoLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)onQQLogin:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

/*
 2016-05-15 12:55:46.059 suishouji[1465:403794] #warning:尚未配置[SinaWeibo]URL Scheme:sinaweibosso.568898243或wb568898243
 2016-05-15 12:58:35.340 suishouji[1465:403794] uid=2027225401
 2016-05-15 12:58:35.341 suishouji[1465:403794] {
 "access_token" = "2.00tvBMNC0H7CVcae1453476b6nvggC";
 "expires_in" = 655286;
 "remind_in" = 655286;
 uid = 2027225401;
 }
 2016-05-15 12:58:35.341 suishouji[1465:403794] token=2.00tvBMNC0H7CVcae1453476b6nvggC
 2016-05-15 12:58:35.341 suishouji[1465:403794] nickname=立笔歇影
 */
- (IBAction)onSinaWeiboLogin:(id)sender {
    //例如QQ的登录
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
         if (state == SSDKResponseStateSuccess) {
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
         } else {
             NSLog(@"%@",error);
         }
     }];
}


@end
