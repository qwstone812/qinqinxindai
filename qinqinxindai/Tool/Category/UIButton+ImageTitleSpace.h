//
//  UIButton+ImageTitleSpace.h
//  duanrong1.01
//
//  Created by mac on 2018/1/16.
//  Copyright © 2018年 hulin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LZBCustomButtonEdgeInsetsStyle) {
    LZBCustomButtonEdgeInsetsStyle_VerticalImageTop,    // image在上，label在下
    LZBCustomButtonEdgeInsetsStyle_HorizontalImageLeft, // image在左，label在右
    LZBCustomButtonEdgeInsetsStyle_VerticalImageBottom, // image在下，label在上
    LZBCustomButtonEdgeInsetsStyle_HorizontalImageRight // image在右，label在左
};
@interface UIButton (ImageTitleSpace)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)setCustomButtonStyle:(LZBCustomButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;
@end

