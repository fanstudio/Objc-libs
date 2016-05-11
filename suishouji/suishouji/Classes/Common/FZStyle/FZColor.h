//
//  FZColor.h
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#ifndef FZColor_h
#define FZColor_h

#ifdef __OBJC__

#define FZColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]          // RGB颜色
#define FZ_ARGB(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a / 255.0] // RGB颜色
#define FZRandomColor FZColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))  // 随机色

#define FZ_VIEW_COLOR FZColor(240, 240, 240)         // 基准色-controller.view的颜色
#define FZ_BLACK_COLOR FZColor(50, 50, 50)           // 基准色-黑色
#define FZ_GRAY_COLOR FZColor(150, 150, 150)         // 基准色-灰色文字
#define FZ_BLUE_COLOR FZColor(63, 141, 208)          // 基准色-蓝色
#define FZ_MENU_COLOR FZColor(36, 42, 47)            // 菜单颜色


#define FZ_BORDER_GRAY_COLOR FZColor(226, 226, 226)       // 适用于控件边框的灰色
#define FZ_COVER_COLOR FZ_ARGB(88, 0, 0, 0)               // 遮罩的颜色
#define FZ_SEPARATOR_COLOR FZColor(235, 235, 235)         // 分隔线的颜色

#endif

#endif /* FZColor_h */
