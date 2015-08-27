//
//  FZTabBarItem.m
//  test
//
//  Created by 张帆 on 15/8/22.
//  Copyright (c) 2015年 fanstudio. All rights reserved.
//

#import "FZTabBarItem.h"

#warning 在此修改文字的未选中与选中状态颜色
// button未选中时的背景图片
#define BUTTON_NORMAL_BACKGROUND_IMAGE (@"normalImage")
// button选中时的背景图片
#define BUTTON_SELECTED_BACKGROUND_IMAGE (@"selectedImage")
// 文字字体和大小
#define TITLE_FONT ([UIFont systemFontOfSize:10.0])
// 文字选择未选中时的颜色
#define TITLE_COLOR ([UIColor colorWithRed:144 / 255.0 green:144 / 255.0 blue:144 / 255.0 alpha:1.0])
// 文字选择时的颜色
#define TITLE_SELECTED_COLOR ([UIColor whiteColor])
// 设置文字与图片上下占的比例
#define IMAGE_TITLE_SCALE (0.7)

@implementation FZTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置状态背景图片
        [self setBackgroundImage:[UIImage imageNamed:BUTTON_NORMAL_BACKGROUND_IMAGE] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:BUTTON_SELECTED_BACKGROUND_IMAGE] forState:UIControlStateSelected];
        
        // 设置文字相关属性
        self.titleLabel.font = TITLE_FONT;
        [self setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
        [self setTitleColor:TITLE_SELECTED_COLOR forState:UIControlStateSelected];

    
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted {
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat imageH = self.bounds.size.height * IMAGE_TITLE_SCALE;
    CGFloat imageW = self.bounds.size.width;
    self.imageView.frame = CGRectMake(0, 0, imageW, imageH);
    self.titleLabel.frame = CGRectMake(0, imageH, imageW, self.bounds.size.height - imageH);
    
}

@end
