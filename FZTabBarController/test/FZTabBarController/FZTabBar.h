//
//  FZTabBar.h
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FZTabBar;



/** 代理方法 */
@protocol FZTabBarDelegate <NSObject>

- (void)tabBar:(FZTabBar *)tabBar didSelected:(NSUInteger)tag;

@end


/** 定义 */
@interface FZTabBar : UIView


@property (nonatomic, weak) id <FZTabBarDelegate> delegate;

- (void)addItemTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage tag:(NSUInteger)tag;

@end
