//
//  DDTouchCircleButton.h
//  DDCircleDemo
//
//  Created by lilingang on 15/9/11.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "DDTouchCircleButton.h"

NSString * const DDStrokeStartAnimation = @"strokeStartAnimation";
NSString * const DDRollBackAnimation = @"rollBackAnimation";

@interface DDTouchCircleButton ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *circleProgressLayer;
@property (nonatomic, strong) CALayer *imageLayer;

@end

@implementation DDTouchCircleButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageLayer = [CALayer layer];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = [[self cyclePath] CGPath];
        self.clipsToBounds = YES;
        self.layer.mask = maskLayer;
        
        self.circleLayer = [self shapeLayer];
        self.circleProgressLayer = [self shapeLayer];
        self.circleProgressLayer.strokeEnd = 0.0;
        [self.layer addSublayer:self.imageLayer];
        [self.layer addSublayer:self.circleLayer];
        [self.layer addSublayer:self.circleProgressLayer];
    }
    return self;
}

#pragma mark - UIResponder

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ddStrokeAnimationDidFinished)]) {
        [self removeTarget:self.delegate action:nil forControlEvents:UIControlEventAllEvents];
        [self strokeAnimation];
    }
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ddStrokeAnimationDidFinished)]) {
        [self rollbackAnimation];
    }
}

#pragma mark - Private Methods

- (void)strokeAnimation{
    [self.circleProgressLayer removeAnimationForKey:DDRollBackAnimation];
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.duration = self.duration;
    strokeAnimation.fromValue = @(0.f);
    strokeAnimation.toValue = @(1.f);
    strokeAnimation.delegate = self;
    [self.circleProgressLayer addAnimation:strokeAnimation forKey:DDStrokeStartAnimation];
}

- (void)rollbackAnimation{
    CGFloat step = [self.circleProgressLayer.presentationLayer strokeEnd];
    [self.circleProgressLayer removeAnimationForKey:DDStrokeStartAnimation];
    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.duration = self.duration * step;
    strokeAnimation.fromValue = @(step);
    strokeAnimation.toValue = @(0.f);
    [self.circleProgressLayer addAnimation:strokeAnimation forKey:DDRollBackAnimation];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [self.delegate ddStrokeAnimationDidFinished];
    }
}

#pragma mark - Setter and Getter

- (UIBezierPath *)cyclePath{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat diameter = MIN(width, height);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(diameter/2.0, diameter/2.0)
                                                        radius:diameter/2.0
                                                    startAngle:-M_PI_2
                                                      endAngle:3*M_PI_2
                                                     clockwise:YES];
    return path;
}

- (CAShapeLayer *)shapeLayer{
    CAShapeLayer *edgeLayer = [CAShapeLayer layer];
    edgeLayer.path = [[self cyclePath] CGPath];
    edgeLayer.fillColor = [[UIColor clearColor] CGColor];
    edgeLayer.strokeStart = 0.0;
    edgeLayer.strokeEnd = 1.0;
    return edgeLayer;
}

- (void)setImage:(UIImage *)image{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    self.imageLayer.frame = CGRectMake((width-image.size.width)/2.0, (height-image.size.height)/2.0, image.size.width, image.size.height);
    self.imageLayer.contents = (id)image.CGImage;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor{
    self.circleLayer.strokeColor = [progressTintColor CGColor];
}

- (void)setTrackTintColor:(UIColor *)trackTintColor{
    self.circleProgressLayer.strokeColor = [trackTintColor CGColor];
}

- (void)setLineWidth:(CGFloat)lineWidth{
    self.circleLayer.lineWidth = lineWidth;
    self.circleProgressLayer.lineWidth = lineWidth;
}

@end
