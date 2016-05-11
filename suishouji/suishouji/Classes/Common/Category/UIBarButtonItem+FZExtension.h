//
//  UIBarButtonItem+FZExtension.h
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FZExtension)

+ (instancetype)barButtonWithTarget:(id)target Image:(NSString *)image highLightImage:(NSString *)highLightImage action:(SEL)action;

+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
