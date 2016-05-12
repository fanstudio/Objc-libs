//
//  SSJSkipWelcomeView.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJSkipWelcomeView.h"
#import "FZStyle.h"

@implementation SSJSkipWelcomeView

- (void)awakeFromNib {
    self.backgroundColor = FZ_COVER_COLOR;
    self.textLabel.textColor = [UIColor whiteColor];
    [self.actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.actionButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.actionButton.layer.borderWidth = 1.0;
}

+ (instancetype)welcomeView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil].lastObject;
}

@end
