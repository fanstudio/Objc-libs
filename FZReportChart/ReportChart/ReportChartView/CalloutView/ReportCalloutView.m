//
//  ReportCalloutView.m
//  ReportChart
//
//  Created by fzhang on 16/4/5.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportCalloutView.h"
#import "ReportArrowView.h"
#import "OAStyle.h"

@interface ReportCalloutView ()

@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) ReportArrowView *arrowView;
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation ReportCalloutView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
        [self setupArrowImageView];
        [self setupTextLabel];
    }
    
    return self;
}

- (void)setupContentView {
    UIView *contentView = [UIView new];
    [self addSubview:contentView];
    self.contentView = contentView;
    contentView.backgroundColor = [UIColor orangeColor];
    contentView.layer.cornerRadius = 5.0;
    contentView.clipsToBounds = YES;
}

- (void)setupArrowImageView {
    ReportArrowView *arrowView = [ReportArrowView new];
    [self addSubview:arrowView];
    self.arrowView = arrowView;
}

- (void)setupTextLabel {
    UILabel *textLabel = [UILabel new];
    [self.contentView addSubview:textLabel];
    self.textLabel = textLabel;
    
    textLabel.font = [UIFont systemFontOfSize:8.0];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.numberOfLines = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat arrowW = 12.0;
    CGFloat arrowH = 6.0;
    
    CGFloat padding = 5.0;
    CGFloat textWidth = 55.0;
    CGFloat textMinHeight = 14.0;
    CGSize textSize = [self sizeWithString:self.textLabel.text
                                      font:self.textLabel.font
                                      maxW:textWidth];
    
    if (textSize.width < textWidth) textSize.width = textWidth;
    if (textSize.height < textMinHeight) textSize.height = textMinHeight;
    
    // 设置自身大小
    self.size = CGSizeMake(2 * padding + textWidth, 2 * padding + textSize.height + arrowH);
    
    // 设置箭头
    self.arrowView.size = CGSizeMake(arrowW, arrowH);
    self.arrowView.x = (self.width - arrowW) * 0.5;
    if (self.arrowUp) {
        self.arrowView.y = 0;
    } else {
        self.arrowView.y = self.height - arrowH;
    }
    
    // 设置contentView
    self.contentView.size = CGSizeMake(self.width, self.height - arrowH);
    self.contentView.x = 0;
    if (self.arrowUp) {
        self.contentView.y = arrowH;
    } else {
        self.contentView.y = 0;
    }
    
    // 设置label
    self.textLabel.frame = CGRectMake(padding, padding, textSize.width, textSize.height);
}

- (void)setArrowUp:(BOOL)arrowUp {
    _arrowUp = arrowUp;
    self.arrowView.arrowUp = arrowUp;
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    self.textLabel.text = text;
    [self setNeedsLayout];
}


- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxW:(CGFloat)maxW {
    if (!string) return CGSizeZero;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    return [string boundingRectWithSize:maxSize
                                options:NSStringDrawingUsesLineFragmentOrigin
                             attributes:attrs context:nil].size;
}

@end
