//
//  ReportPointButton.m
//  ReportChart
//
//  Created by fzhang on 16/4/5.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportPointButton.h"
#import "ReportChartPoint.h"

@implementation ReportPointButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"pro_in_construction"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"pro_complete"] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
