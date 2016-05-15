//
//  SSJLoginController.m
//  suishouji
//
//  Created by 张帆 on 16/5/15.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJLoginController.h"
#import "SSJDoLoginController.h"

@implementation SSJLoginController

- (instancetype)init {
    return [super initWithRootViewController:[SSJDoLoginController new]];
}

@end
