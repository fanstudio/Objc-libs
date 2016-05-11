//
//  ReportChartCanvasView.m
//  ReportChart
//
//  Created by fzhang on 16/3/31.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportChartCanvasView.h"
#import "ReportChartPoint.h"
#import "ReportPointButton.h"
#import "ReportCalloutView.h"
#import "OAStyle.h"

@interface ReportChartCanvasView ()

@property (nonatomic, strong) ReportCalloutView *calloutView;

@end

@implementation ReportChartCanvasView

- (ReportCalloutView *)calloutView {
    if (!_calloutView) {
        _calloutView = [ReportCalloutView new];
    }
    return _calloutView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawBackgroundWithContext:context];
}

#pragma mark - 对外接口

- (void)reloadData {
    // 移出旧控件
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:ReportPointButton.class]) {
            [view removeFromSuperview];
        }
    }
    
    // 添加新控件
    for (ReportChartPoint *point in self.points) {
        ReportPointButton *button = [ReportPointButton new];
        button.model = point;
        button.selected = point.finish;
        [self addSubview:button];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
        
        CGFloat centerX = [self placeWithScale:point.xScaleValue inArray:self.xDatas];
        CGFloat centerY = [self placeWithScale:point.yScaleValues inArray:self.yDatas];
        button.size = CGSizeMake(10.0, 10.0);
        button.center = CGPointMake(centerX, centerY);
    }
    
    // 重绘背景
    [self setNeedsDisplay];
}

#pragma mark - 事件

- (void)onClick:(ReportPointButton *)button {
    [self showCalloutWithButton:button];
}

- (void)onTap {
    [self.calloutView removeFromSuperview];
}

#pragma mark - 工具方法

#pragma mark 闭合背景走势

- (void)drawBackgroundWithContext:(CGContextRef)context {
    [OA_ARGB(127, 132, 214, 194) set];
    
    // 起点
    CGContextMoveToPoint(context, [self.xDatas[0] floatValue], [self.yDatas[0] floatValue]);
    
    NSInteger idx = 0;
    for (ReportChartPoint *point in self.points) {
        CGFloat pointX = [self placeWithScale:point.xScaleValue inArray:self.xDatas];
        CGFloat pointY = [self placeWithScale:point.yScaleValues inArray:self.yDatas];
        CGContextAddLineToPoint(context, pointX, pointY);
        if ((idx + 1) == self.points.count) {
            CGContextAddLineToPoint(context, pointX, [self.yDatas[0] floatValue]);
        }
        idx++;
    }
    
    // 终点
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 描点

- (void)drawPointsWithContext:(CGContextRef)context {
    [OAColor(255, 127, 0) set];;
    
    for (ReportChartPoint *point in self.points) {
        CGFloat centerX = [self placeWithScale:point.xScaleValue inArray:self.xDatas];
        CGFloat centerY = [self placeWithScale:point.yScaleValues inArray:self.yDatas];
        CGContextAddArc(context, centerX, centerY, 2.0, 0, M_PI * 2, 0);
        CGContextDrawPath(context, kCGPathFillStroke);
    }
}

#pragma mark 计算坐标

- (CGFloat)placeWithScale:(CGFloat)scale inArray:(NSArray *)array {
    CGFloat num = 0.0;
    if (array.count < 2) return num;
    
    CGFloat perNum = [array[1] floatValue] - [array[0] floatValue];
    NSInteger base = (NSInteger)scale;
    CGFloat little = scale - base;
    num = [array[base] floatValue];
    
    if (little > 0) {
        num += little * perNum;
    }
    
    return num;
}

- (void)showCalloutWithButton:(ReportPointButton *)button {
    [self.calloutView removeFromSuperview];
    
    // 赋值
    self.calloutView.text = button.model.mark;
    self.calloutView.arrowUp = (button.center.y < self.height * 0.5);
    
    // 计算位置
    CGFloat centerX = button.center.x;
    CGFloat centerY;
    if (self.calloutView.arrowUp) {
        centerY = CGRectGetMaxY(button.frame) + self.calloutView.height * 0.5;
    } else {
        centerY = CGRectGetMinY(button.frame) - self.calloutView.height * 0.5;
    }
    self.calloutView.center = CGPointMake(centerX, centerY);
    
    [self addSubview:self.calloutView];
}

@end
