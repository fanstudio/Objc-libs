//
//  ViewController.m
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ViewController.h"
#import "ReportChartView.h"
#import "OAStyle.h"

@interface ViewController ()

@property (nonatomic, weak) ReportChartView *chartView;
@property (nonatomic, weak) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = OA_BASE_VIEW_COLOR;
    
    [self setupChartView];
    [self setupContentView];
    [self loadChartViewData];
}

- (void)setupChartView {
    ReportChartView *chartView = [ReportChartView new];
    [self.view addSubview:chartView];
    self.chartView = chartView;
}

- (void)setupContentView {
    UIView *contentView = [UIView new];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    contentView.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.chartView.frame = CGRectMake(0, 20, self.view.width, self.view.height * 0.4);
    
    CGFloat contentX = 0.0;
    CGFloat contentY = CGRectGetMaxY(self.chartView.frame) + PADDING;
    CGFloat contentW = self.view.width;
    CGFloat contentH = self.view.height - CGRectGetMaxY(self.chartView.frame);
    self.contentView.frame = CGRectMake(contentX, contentY, contentW, contentH);
}


- (void)loadChartViewData {
    // 1.添加指示标志
    NSMutableAttributedString *indicatorStr = [[NSMutableAttributedString alloc] init];
    [indicatorStr appendAttributedString:[self stringWithText:@"建设" image:@"pro_in_construction"]];
    [indicatorStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    [indicatorStr appendAttributedString:[self stringWithText:@"竣工" image:@"pro_complete"]];
    self.chartView.indicatorLabel.attributedText = indicatorStr;

    // 2.设定标题
    NSAttributedString *title1 = [self attributeText:@"年累、完成本年计划投资比例\n"
                                           withColor:OAColor(91, 170, 217) font:FONT_LEVEL1];
    NSAttributedString *title2 = [self attributeText:@"(万元)"
                                           withColor:OA_BASE_COLOR_GRAY font:FONT_LEVEL3];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] init];
    [title appendAttributedString:title1];
    [title appendAttributedString:title2];
    self.chartView.titleLabel.attributedText = title;
    
    // 更新x,y轴,以及需要显示的坐标的值
    NSMutableArray *xValues = [NSMutableArray array];
    for (NSInteger idx = 1; idx <= 12; idx++) {
        [xValues addObject:[NSString stringWithFormat:@"%d月", idx]];
    }
    NSMutableArray *yValues = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 12; idx++) {
        [yValues addObject:[NSString stringWithFormat:@"%d", idx * 5000]];
    }
    
    NSMutableArray *points = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 12; idx++) {
        ReportChartPoint *point = [ReportChartPoint new];
        point.xScaleValue = idx;
        point.yScaleValues = arc4random_uniform(12);
        point.mark = @"测试数据:xx月\nxxx万元\n10%";
        point.finish = (idx == 11);
        [points addObject:point];
    }
    
    [self.chartView updateChartWithXValues:xValues yValues:yValues points:points];
}


#pragma mark - 工具方法

- (NSAttributedString *)attributeText:(NSString *)text withColor:(UIColor *)color font:(UIFont *)font {
    NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
    textDic[NSForegroundColorAttributeName] = color;
    textDic[NSFontAttributeName] = font;
    NSAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text attributes:textDic];
    return str;
}

- (NSAttributedString *)stringWithText:(NSString *)text image:(NSString *)imagePath {
    // 图片
    UIImage *image = [UIImage imageNamed:imagePath];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = image;
    attach.bounds = CGRectMake(5, -1.5, image.size.width, image.size.height);
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attach];
    
    // 文字
    NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
    textDic[NSForegroundColorAttributeName] = OA_BASE_COLOR_GRAY;
    textDic[NSFontAttributeName] = [UIFont systemFontOfSize:8.0];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text attributes:textDic];
    [str appendAttributedString:imageStr];
    
    return str;
}

@end
