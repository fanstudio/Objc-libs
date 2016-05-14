//
//  FZSize.h
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#ifndef FZSize_h
#define FZSize_h

#ifdef __OBJC__


#define FONT(size) ([UIFont systemFontOfSize:size])

#define FONT_SIZE_TITLE1 18.0
#define FONT_SIZE_TITLE2 16.0
#define FONT_SIZE_TITLE3 15.0
#define FONT_SIZE_LEVEL1 14.0
#define FONT_SIZE_LEVEL2 12.0
#define FONT_SIZE_LEVEL3 10.0

#define FONT_TITLE1 FONT(FONT_SIZE_TITLE1)
#define FONT_TITLE2 FONT(FONT_SIZE_TITLE2)
#define FONT_TITLE3 FONT(FONT_SIZE_TITLE3)

#define FONT_LEVEL1 FONT(FONT_SIZE_LEVEL1)
#define FONT_LEVEL2 FONT(FONT_SIZE_LEVEL2)
#define FONT_LEVEL3 FONT(FONT_SIZE_LEVEL3)

#define PADDING 10
#define NAVIGATION_BAR_AND_STATUS_BAR_HEIGHT 64
#define GENERAL_CELL_HEIGHT 44
#define TABBAR_HEIGHT 49
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#endif

#endif /* FZSize_h */
