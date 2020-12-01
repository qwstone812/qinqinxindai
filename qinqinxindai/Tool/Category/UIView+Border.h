//
//  UIView+Border.h
//  duanrong1.01
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 hulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)
/*
 *  给UIView添加边缘border 与 border的颜色设置
 */

// 下
- (void)addBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;
// 上
- (void)addTopBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;
// 左
- (void)addLeftBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;
// 右
- (void)addRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;
// 上和下
- (void)addTopAndBottomBorderWithBorderColor:(UIColor *)borderColor WithHeight:(CGFloat)borderHeight;
// 左和右
- (void)addLeftAndRightBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;
//上下左右
- (void)addAllBorderWithBorderColor:(UIColor *)borderColor WithWidth:(CGFloat)borderWidth;


@end
