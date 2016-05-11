//
//  RightViewController.m
//  test
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "RightViewController.h"
#import "FZMenuController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)onClickRight:(id)sender {
    FZMenuController *vc = (FZMenuController *)self.parentViewController;
    [vc showOrHideMenuView];
}



@end
