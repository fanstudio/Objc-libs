//
//  FZTabBar.m
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import "FZTabBar.h"
#import "FZTabBarItem.h"



#warning 在此修改自定义的tabBar的颜色
// tabBarItem的颜色
#define TAB_BAR_BGCOLOR ([UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:233 / 255.0 alpha:1.0])


@interface FZTabBar()

/** 上一次选中的button */
@property (nonatomic, weak) FZTabBarItem *lastSelected;

@end

@implementation FZTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = TAB_BAR_BGCOLOR;
    }
    return self;
}

- (void)addItemTitle:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage tag:(NSUInteger)tag {
    
    FZTabBarItem *btn = [[FZTabBarItem alloc] init];
    // 设置文字
    [btn setTitle:title forState:UIControlStateNormal];

    // 设置状态图片
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];

    btn.tag = tag;
    [btn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    [self setNeedsLayout];
    
    if (!self.lastSelected) {
        [self selected:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 重新布局子控件
    NSInteger count = self.subviews.count;
    CGFloat width = self.frame.size.width / count;
    CGFloat height = self.frame.size.height;
    for (NSInteger i = 0; i < count; i++) {
        FZTabBarItem *btn = self.subviews[i];
        btn.frame = CGRectMake(i * width, 0, width, height);
    }
}

- (void)selected:(FZTabBarItem *)btn {
    // 状态切换
    self.lastSelected.selected = NO;
    btn.selected = YES;
    self.lastSelected = btn;
    
    // 触发相应的事件
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelected:)]) {
        [self.delegate tabBar:self didSelected:btn.tag];
    }
}


@end
