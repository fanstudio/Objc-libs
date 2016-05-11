//
//  ReportChartView.m
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportChartView.h"
#import "ReportChartDirectionView.h"
#import "ReportChartBoard.h"
#import "OAStyle.h"



@interface ReportChartView ()
// 布局控件
@property (nonatomic, weak) UIView *chartTitleView;
@property (nonatomic, weak) UIView *chartContentView;
@property (nonatomic, weak) ReportChartDirectionView *chartYView;
@property (nonatomic, weak) ReportChartDirectionView *chartXView;
@property (nonatomic, weak) ReportChartBoard *chartView;

// 数据
@property (nonatomic, strong) NSArray <NSString *> *xValues;
@property (nonatomic, strong) NSArray <NSString *> *yValues;

@end

@implementation ReportChartView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = OAColor(72, 72, 72);
        self.backgroundColor = [UIColor whiteColor];
        [self setupChartTitleView];     // 标题部分
        [self setupChartContentView];   // 表格部分
    }
    return self;
}

#pragma mark - 表格标题

- (void)setupChartTitleView {
    UIView *chartTitleView = [UIView new];
    [self addSubview:chartTitleView];
    self.chartTitleView = chartTitleView;
    
    [self setupIndicatorLabel];
    [self setupTitleLabel];
}

- (void)setupIndicatorLabel {
    _indicatorLabel = [UILabel new];
    [self.chartTitleView addSubview:_indicatorLabel];
    _indicatorLabel.numberOfLines = 0;
}

- (void)setupTitleLabel {
    _titleLabel = [UILabel new];
    [self.chartTitleView addSubview:_titleLabel];
    _titleLabel.font = FONT_LEVEL2;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = OA_BASE_COLOR_BLACK;
    _titleLabel.numberOfLines = 0;
}

#pragma mark - 表格

- (void)setupChartContentView {
    UIView *chartContentView = [UIView new];
    [self addSubview:chartContentView];
    self.chartContentView = chartContentView;
    
    [self setupChartYView];         // Y轴的内容
    [self setupChartXView];         // X轴的内容
    [self setupChartView];          // 表格图形绘制区
}


#pragma mark Y轴的内容
- (void)setupChartYView {
    ReportChartDirectionView *chartYView = [[ReportChartDirectionView alloc]
                                            initWithDirection:ReportChartDiretionYAxis];
    [self.chartContentView addSubview:chartYView];
    self.chartYView = chartYView;
}

#pragma mark X轴的内容
- (void)setupChartXView {
    ReportChartDirectionView *chartXView = [[ReportChartDirectionView alloc]
                                            initWithDirection:ReportChartDiretionXAxis];
    [self.chartContentView addSubview:chartXView];
    self.chartXView = chartXView;
}

#pragma mark 表格图形绘制区
- (void)setupChartView {
    ReportChartBoard *chartView = [ReportChartBoard new];
    [self.chartContentView addSubview:chartView];
    self.chartView = chartView;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat leftScale = 0.15;
    
    // 1.表格的标题容器
    CGFloat chartTitleX = PADDING;
    CGFloat chartTitleY = PADDING;
    CGFloat chartTitleW = self.width - 2 * PADDING;
    CGFloat chartTitleH = 44.0;
    self.chartTitleView.frame = CGRectMake(chartTitleX, chartTitleY, chartTitleW, chartTitleH);
    
    // 1.1指示标志
    CGFloat indicatorX = 0.0;
    CGFloat indicatorY = 0.0;
    CGFloat indicatorW = self.chartTitleView.width *leftScale;
    CGFloat indicatorH = self.chartTitleView.height;
    self.indicatorLabel.frame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
    
    // 1.2文字标题
    CGFloat titleX = indicatorW;
    CGFloat titleY = 0.0;
    CGFloat titleW = self.chartTitleView.width - indicatorW;
    CGFloat titleH = self.chartTitleView.height;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 2.表格本身的容器
    CGFloat charContentX = PADDING;
    CGFloat charContentY = CGRectGetMaxY(self.chartTitleView.frame);
    CGFloat charContentW = chartTitleW;
    CGFloat charContentH = self.height - chartTitleH - 2 * PADDING;
    self.chartContentView.frame = CGRectMake(charContentX, charContentY, charContentW, charContentH);
    
    // 2.1左侧Y轴区域
    CGFloat bottomH = 20.0;
    CGFloat leftX = 0.0;
    CGFloat leftY = 0.0;
    CGFloat leftW = self.chartContentView.width * leftScale;
    CGFloat leftH = self.chartContentView.height - bottomH;
    self.chartYView.frame = CGRectMake(leftX, leftY, leftW, leftH);
    
    // 2.2底部X轴区域
    CGFloat bottomX = leftW;
    CGFloat bottomY = leftH;
    CGFloat bottomW = self.chartContentView.width - leftW;
    self.chartXView.frame = CGRectMake(bottomX, bottomY, bottomW, bottomH);
    
    // 2.3表格绘图区
    CGFloat rightX = leftW;
    CGFloat rightY = 0.0;
    CGFloat rightW = self.chartContentView.width - leftW;
    CGFloat rightH = self.chartContentView.height - bottomH;
    self.chartView.frame = CGRectMake(rightX, rightY, rightW, rightH);
    
}

#pragma mark - 工具方法


#pragma mark - 对外接口
- (void)updateChartWithXValues:(NSArray *)xValues
                       yValues:(NSArray *)yValues
                        points:(NSArray <ReportChartPoint *> *)points {
    self.xValues = xValues;
    self.yValues = yValues;
    
    // 更新刻度
    [self.chartView updateXNum:xValues.count yNum:yValues.count points:points];
    self.chartXView.values = xValues;
    self.chartYView.values = yValues;
}

@end
