//
//  LHCircleView.m
//  LH_Animation
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 李欢. All rights reserved.
//

#import "LHCircleView.h"
CGFloat radius = 60.0;
CGFloat startAngle = -M_PI/2;
CGFloat endAngle = M_PI * 2 -M_PI/2;
@interface LHCircleView()
@property  (nonatomic, strong) CAShapeLayer *progressLayer;
@property  (nonatomic, strong) UILabel      *percentLabel;
@property  (nonatomic, assign) CGFloat progress;
@property  (nonatomic, strong) NSTimer *timer;
@property  (nonatomic, assign) CGFloat lastTime;
@end
@implementation LHCircleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawBgCircle];
    }
    return self;
}

- (void)drawBgCircle
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.path = path.CGPath;
    bgLayer.lineWidth = 5;
    bgLayer.fillColor = [UIColor clearColor].CGColor;
    bgLayer.strokeColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:bgLayer];
   
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = path.CGPath;
    self.progressLayer.lineWidth = 5;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor yellowColor].CGColor;
    [self addSubview:self.percentLabel];
    [self.layer addSublayer:self.progressLayer];
    self.lastTime = 0.0;
    self.timer = [NSTimer timerWithTimeInterval:0.03 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self beginAnimated];
    }];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)beginAnimated
{
    self.lastTime += 0.01;
    if (self.lastTime > 1) {
        
        [self.timer invalidate];
    }
    self.progress = self.lastTime;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    self.percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
    _progressLayer.strokeEnd = progress;
    [_progressLayer removeAllAnimations];
}

- (UILabel *)percentLabel
{
    if (!_percentLabel) {
        _percentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _percentLabel.backgroundColor = [UIColor clearColor];
        _percentLabel.text = [NSString stringWithFormat:@"0.00"];
        _percentLabel.textAlignment = NSTextAlignmentCenter;
        _percentLabel.font = [UIFont systemFontOfSize:15];
        _percentLabel.textColor = [UIColor grayColor];
    }
    return _percentLabel;
}
@end
