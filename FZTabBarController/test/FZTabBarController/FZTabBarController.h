//
//  FZTabBarController.h
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZTabBarController : UITabBarController


- (void)addChildVC:(UIViewController *)childController title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;
@end
