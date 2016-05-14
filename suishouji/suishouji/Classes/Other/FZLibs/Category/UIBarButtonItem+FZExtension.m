//
//  UIBarButtonItem+FZExtension.m
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "UIBarButtonItem+FZExtension.h"

@implementation UIBarButtonItem (FZExtension)

+ (instancetype)barButtonWithTarget:(id)target Image:(NSString *)image highLightImage:(NSString *)highLightImage action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    if (image) {
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    if (highLightImage) {
        [btn setImage:[UIImage imageNamed:highLightImage] forState:UIControlStateHighlighted];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (instancetype)barButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
