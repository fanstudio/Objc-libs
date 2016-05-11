//
//  ReportChartDirectionView.h
//  ReportChart
//
//  Created by fzhang on 16/3/30.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ReportChartDiretionXAxis,       // X轴
    ReportChartDiretionYAxis        // Y轴
}ReportChartDiretionType;

@interface ReportChartDirectionView : UIView

/** x或y轴的标记值 */
@property (nonatomic, strong) NSArray <NSString *>*values;

- (instancetype)initWithDirection:(ReportChartDiretionType)direction;

@end
