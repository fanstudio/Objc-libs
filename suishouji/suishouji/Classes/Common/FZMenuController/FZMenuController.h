//
//  FZMenuController.h
//  test
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZMenuController : UIViewController

/** 是否隐藏菜单，如果为TRUE，或滚动失效 */
@property (nonatomic, assign) BOOL hideMenuEnable;

/**
 menuVc - 左侧菜单控制器
 contentVc - 右侧内容控制器
 leftWidthScale - 左侧菜单的宽度占据整个宽度的比例
 */
- (instancetype)initWithMenuVc:(UIViewController *)menuVc
                     contentVc:(UIViewController *)contentVc
                leftWidthScale:(CGFloat)leftWidthScale;

/** 显示或隐藏菜单栏 */
- (void)showOrHideMenuView;

@end
