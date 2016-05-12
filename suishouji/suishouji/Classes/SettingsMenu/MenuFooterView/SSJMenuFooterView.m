//
//  SSJMenuFooterView.m
//  suishouji
//
//  Created by 张帆 on 16/5/12.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#import "SSJMenuFooterView.h"
#import "FZStyle.h"

@implementation SSJMenuFooterView

- (void)awakeFromNib {
    self.backgroundColor = FZ_MENU_COLOR;
    self.introduceLabel.textColor = FZ_GRAY_COLOR;
    self.nameLabel.textColor = FZ_GRAY_COLOR;
}


+ (instancetype)footerView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil].lastObject;
}

@end
