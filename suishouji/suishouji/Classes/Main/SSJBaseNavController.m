//
//  SSJBaseNavController.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJBaseNavController.h"
#import "UIBarButtonItem+FZExtension.h"

@interface SSJBaseNavController ()

@end

@implementation SSJBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTarget:self Image:@"backbtn" highLightImage:nil action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}



@end
