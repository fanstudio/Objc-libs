//
//  ReportChartPoint.h
//  ReportChart
//
//  Created by fzhang on 16/3/31.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReportChartPoint : NSObject

/** x占的比例值，如x每一份为500，实际需要显示的值为1000,则xScaleValue = 1000 / 500 */
@property (nonatomic, assign) float xScaleValue;
/** y占的比例值，如y每一份为100，实际需要显示的值为1000,则yScaleValue = 1000 / 100 */
@property (nonatomic, assign) float yScaleValues;
/** 每个点，被选中后显示的值 */
@property (nonatomic, copy) NSString *mark;
/** 是否完成 */
@property (nonatomic, assign) BOOL finish;

@end
