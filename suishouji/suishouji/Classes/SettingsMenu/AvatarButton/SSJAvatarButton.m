//
//  SSJAvatarButton.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJAvatarButton.h"
#import "FZStyle.h"
#import "UIView+Layout.h"

@implementation SSJAvatarButton

- (void)awakeFromNib {
    self.backgroundColor = FZ_MENU_COLOR;
    self.seperator.backgroundColor = FZ_GRAY_COLOR;
    self.avatarImageView.backgroundColor = FZ_GRAY_COLOR;
    self.avatarImageView.clipsToBounds = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.width * 0.5;
}

+ (instancetype)avatarButton {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil].lastObject;
}

@end
