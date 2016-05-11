//
//  OAColor.h
//  Oa
//
//  Created by fzhang on 16/3/24.
//  Copyright © 2016年 cdmetro. All rights reserved.
//

#ifndef OAColor_h
#define OAColor_h
#ifdef __OBJC__

#define OAColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]          // RGB颜色
#define OA_ARGB(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a / 255.0] // RGB颜色
#define JMGRandomColor OAColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))  // 随机色

#define OA_BASE_VIEW_COLOR OAColor(240, 240, 240)         // 基准色-controller.view的颜色
#define OA_BASE_COLOR_BLACK OAColor(50, 50, 50)           // 基准色-黑色
#define OA_BASE_COLOR_GRAY OAColor(150, 150, 150)         // 基准色-灰色文字

#define OA_BORDER_COLOR_GRAY OAColor(226, 226, 226)       // 适用于控件边框的灰色
#define OA_COVER_COLOR OA_ARGB(88, 0, 0, 0)               // 遮罩的颜色
#define OA_SEPARATOR_COLOR OAColor(235, 235, 235)         // 分隔线的颜色

#endif
#endif /* OAColor_h */
