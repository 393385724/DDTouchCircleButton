//
//  DDTouchCircleButton.h
//  DDCircleDemo
//
//  Created by lilingang on 15/9/11.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDTouchCircleButtonDelegate <NSObject>

- (void)ddStrokeAnimationDidFinished;

@end

@interface DDTouchCircleButton : UIControl

/**
 *  if not implemented delegate ,it use like button,
 *  - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
 *  if implemented delegate when touch it will show animation and call back
 *  @note can only choose one
 */
@property (nonatomic, weak) id<DDTouchCircleButtonDelegate> delegate;

/**
 *  显示的图片
 */
@property (nonatomic, strong) UIImage *image;

/**
 *  animation duration
 */
@property (nonatomic, assign) CGFloat duration;

/**
 *  @description The color shown for the portion of the progress bar that is filled.
 */
@property (nonatomic, strong) UIColor* progressTintColor;

/**
 *  The color shown for the portion of the progress bar that is not filled.
 */
@property (nonatomic, strong) UIColor* trackTintColor;

/**
 *  Specifies the line width of the progress. Animatable
 */
@property (nonatomic, assign) CGFloat lineWidth;

@end
