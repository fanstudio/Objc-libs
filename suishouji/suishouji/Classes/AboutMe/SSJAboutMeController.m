//
//  SSJAboutMeController.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJAboutMeController.h"
#import "FZStyle.h"

@interface SSJAboutMeController ()

@end

@implementation SSJAboutMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setProgressTintColor:FZ_MENU_COLOR];
    [self loadPageWithUrl:@"http://www.mionsoft.com"];
}



@end
