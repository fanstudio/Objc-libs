//
//  ReportChartCanvasView.h
//  ReportChart
//
//  Created by fzhang on 16/3/31.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReportChartPoint;

@interface ReportChartCanvasView : UIView

/** 需要描的点 */
@property (nonatomic, strong) NSArray <ReportChartPoint *> *points;
@property (nonatomic, strong) NSArray *xDatas;
@property (nonatomic, strong) NSArray *yDatas;

- (void)reloadData;

@end
