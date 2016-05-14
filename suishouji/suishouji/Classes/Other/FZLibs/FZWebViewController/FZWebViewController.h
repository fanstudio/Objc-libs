//
//  FZWebViewController.h
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FZWebViewController : UIViewController 

/** 当前页面状态是否能像浏览器那样后退 */
@property (nonatomic, assign) BOOL webPageCanGoBack;

/** 进度条颜色，默认为green */
- (void)setProgressTintColor:(nonnull UIColor *)progressTintColor;

/** 加载并显示指定的URL */
- (void)loadPageWithUrl:(nonnull NSString *)urlString;

/** 返回 */
- (void)goBack;

@end
