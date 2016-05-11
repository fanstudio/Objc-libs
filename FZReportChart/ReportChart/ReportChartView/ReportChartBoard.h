//
//  ReportChartBoard.h
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ReportChartPoint;

@interface ReportChartBoard : UIView

- (void)updateXNum:(NSUInteger)xNum yNum:(NSUInteger)yNum points:(NSArray <ReportChartPoint *> *)points;

@end
