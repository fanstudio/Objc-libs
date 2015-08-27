//
//  TestTabBarController.m
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import "TestTabBarController.h"
#import "FZTabBarController.h"



@interface TestTabBarController ()

@end

@implementation TestTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor orangeColor];
    [self addChildVC:vc1 title:@"钱进贷" normalImage:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor greenColor];
    [self addChildVC:vc2 title:@"我要投资" normalImage:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor blueColor];
    [self addChildVC:vc3 title:@"活动专区" normalImage:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    [self addChildVC:vc4 title:@"个人中心" normalImage:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}


@end
