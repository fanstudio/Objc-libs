//
//  ReportChartView.h
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportChartPoint.h"

@interface ReportChartView : UIView

/** 表格的标题 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/** 表格指示说明 */
@property (nonatomic, strong, readonly) UILabel *indicatorLabel;

/** 更新表格显示
 * xValues - x轴需要显示的标记数据，如1月，2月...
 * yValues - y轴需要显示的标记数据，如500，1000，1500...
*/
- (void)updateChartWithXValues:(NSArray <NSString *> *)xValues
                       yValues:(NSArray <NSString *> *)yValues
                        points:(NSArray <ReportChartPoint *> *)points;


@end
