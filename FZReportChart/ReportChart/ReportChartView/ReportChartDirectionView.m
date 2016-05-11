//
//  ReportChartDirectionView.m
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportChartDirectionView.h"
#import "OAStyle.h"

@interface ReportChartDirectionView ()

@property (nonatomic, assign) ReportChartDiretionType direction;

@end

@implementation ReportChartDirectionView

- (instancetype)initWithDirection:(ReportChartDiretionType)direction {
    if (self = [super init]) {
        self.direction = direction;
    }
    return self;
}

- (void)setValues:(NSArray<NSString *> *)values {
    _values = values;
    
    // 移出旧的控件
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    // 添加新控件
    __weak typeof (self) weakSelf = self;
    [values enumerateObjectsUsingBlock:^(NSString * _Nonnull string, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf addText:string];
    }];
    
    [self setNeedsLayout];
}

- (void)addText:(NSString *)text {
    UILabel *label = [UILabel new];
    [self addSubview:label];
    
    label.textColor = OA_BASE_COLOR_GRAY;
    label.font = [UIFont systemFontOfSize:8.0];
    label.text = text;
    if (self.direction == ReportChartDiretionXAxis) {
        label.textAlignment = NSTextAlignmentCenter;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.direction == ReportChartDiretionXAxis) {
        [self layoutXAxis];
    } else if (self.direction == ReportChartDiretionYAxis) {
        [self layoutYAxis];
    }
}

- (void)layoutXAxis {
    CGFloat w = self.frame.size.width / self.subviews.count;
    CGFloat h = self.frame.size.height;
    
    NSInteger idx = 0;
    for (UIView *view in self.subviews) {
        view.frame = CGRectMake(idx * w, 0, w, h);
        idx++;
    }
}

- (void)layoutYAxis {
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height / self.subviews.count;
    
    NSInteger idx = 0;
    NSInteger count = self.subviews.count;
    for (UIView *view in self.subviews) {
        view.frame = CGRectMake(0, (count - idx - 1) * h, w, h);
        idx++;
    }
}

@end
