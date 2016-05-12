//
//  SSJSkipWelcomeView.h
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSJSkipWelcomeView : UIView

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

+ (instancetype)welcomeView;

@end
