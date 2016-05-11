//
//  ReportChartBoard.m
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportChartBoard.h"
#import "ReportChartCanvasView.h"
#import "OAStyle.h"


@interface HorizontalLine : UIView
@end
@implementation HorizontalLine
@end

@interface VerticallLine : UIView
@end
@implementation VerticallLine
@end


@interface ReportChartBoard ()

@property (nonatomic, weak) UIView *horizontalContentView;     // 水平线容器
@property (nonatomic, weak) UIView *verticallContentView;      // 垂直线容器
@property (nonatomic, weak) ReportChartCanvasView *canvas;     // 画布
@property (nonatomic, assign) NSUInteger xNum;
@property (nonatomic, assign) NSUInteger yNum;

@end

@implementation ReportChartBoard

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {        
        [self setupHorizontalContentView];      // 水平方向线条容器
        [self setupVerticallContentView];       // 竖直方向线条容器
        [self setupCanvas];                     // 添加画板
    }
    return self;
}

- (void)setupHorizontalContentView {
    UIView *horizontalContentView = [UIView new];
    [self addSubview:horizontalContentView];
    self.horizontalContentView = horizontalContentView;
}

- (void)setupVerticallContentView {
    UIView *verticallContentView = [UIView new];
    [self addSubview:verticallContentView];
    self.verticallContentView = verticallContentView;
    verticallContentView.hidden = YES;
}

- (void)setupCanvas {
    ReportChartCanvasView *canvas = [ReportChartCanvasView new];
    [self addSubview:canvas];
    self.canvas = canvas;
    canvas.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.布局画布
    CGFloat xPadding = self.width / self.xNum / 2;
    CGFloat yPadding = self.height / self.yNum / 2;
    self.canvas.frame = self.bounds;
    
    // 2.布局水平线条
    self.horizontalContentView.frame = self.bounds;
    CGFloat yspace = self.height / self.yNum;
    
    NSInteger idx = 0;
    CGFloat tmpY;
    NSMutableArray *yDatas = [NSMutableArray array];
    for (UIView *line in self.horizontalContentView.subviews) {
        line.size = CGSizeMake(self.horizontalContentView.width, 1);
        line.center = CGPointMake(self.horizontalContentView.width * 0.5, yPadding + idx * yspace);
        // 记下y值
        tmpY = [self.horizontalContentView convertPoint:line.center toView:self.canvas].y;
        [yDatas insertObject:@(tmpY) atIndex:0];
        idx++;
    }
    
    // 3.布局垂直线条
    self.verticallContentView.frame = self.bounds;
    CGFloat xspace = self.width / self.xNum;
    
    idx = 0;
    CGFloat tmpX;
    NSMutableArray *xDatas = [NSMutableArray array];
    for (UIView *line in self.verticallContentView.subviews) {
        line.size = CGSizeMake(1, self.height);
        line.center = CGPointMake(xPadding + idx * xspace, self.height * 0.5);
        // 记下X值
        tmpX = [self.verticallContentView convertPoint:line.center toView:self.canvas].x;
        [xDatas addObject:@(tmpX)];
        idx++;
    }
    
    // 4.将算出的坐标刻度交给画板
    self.canvas.xDatas = xDatas;
    self.canvas.yDatas = yDatas;
    [self.canvas reloadData];
}

#pragma mark - 对外接口

- (void)updateXNum:(NSUInteger)xNum yNum:(NSUInteger)yNum points:(NSArray <ReportChartPoint *> *)points {
    if (!xNum || !yNum) return;
    
    if (self.yNum != yNum) {
        self.yNum = yNum;
        [self addHorizontalLine];
    }
    
    if (self.xNum != xNum) {
        self.xNum = xNum;
        [self addVerticallLine];
    }
    
    self.canvas.points = points;
    
    [self setNeedsLayout];
}

#pragma mark - 工具方法

- (void)addHorizontalLine {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:HorizontalLine.class]) {
            [view removeFromSuperview];
        }
    }
    
    for (NSUInteger idx = 0; idx < self.yNum; idx++) {
        HorizontalLine *hLine = [HorizontalLine new];
        [self.horizontalContentView addSubview:hLine];
        hLine.backgroundColor = OAColor(238, 238, 238);
    }
}

- (void)addVerticallLine {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:VerticallLine.class]) {
            [view removeFromSuperview];
        }
    }
    
    for (NSUInteger idx = 0; idx < self.xNum; idx++) {
        VerticallLine *vLine = [VerticallLine new];
        [self.verticallContentView addSubview:vLine];
        vLine.backgroundColor = OAColor(238, 238, 238);
    }
}

@end
