//
//  ReportArrowView.m
//  ReportChart
//
//  Created by fzhang on 16/4/5.
//  Copyright © 2016年 fzhang. All rights reserved.
//

#import "ReportArrowView.h"
#import "OAStyle.h"

@implementation ReportArrowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor orangeColor] set];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (self.arrowUp) {
        CGContextMoveToPoint(context, 0, self.height);
        CGContextAddLineToPoint(context, self.width, self.height);
        CGContextAddLineToPoint(context, self.frame.size.width * 0.5, 0);
    } else {
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, self.frame.size.width, 0);
        CGContextAddLineToPoint(context, self.frame.size.width * 0.5, self.frame.size.height);
    }

    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

- (void)setArrowUp:(BOOL)arrowUp {
    _arrowUp = arrowUp;
    
    [self setNeedsDisplay];
}



@end
