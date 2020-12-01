//
//  UILabel+LXAdd.h
//  LXLabelDemo
//
//  Created by 刘鑫 on 16/4/13.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LXAdd)
/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat characterSpace;

/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat lineSpace;

/**
 *  关键字
 */
@property (nonatomic,copy)NSString *keywords;
@property (nonatomic,strong)UIFont *keywordsFont;
@property (nonatomic,strong)UIColor *keywordsColor;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString *underlineStr;
@property (nonatomic,strong)UIColor *underlineColor;

/**
 *  计算label宽高，必须调用
 *
 *  @param maxWidth 最大宽度
 *
 *  @return label的rect
 */
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

/**
 *  计算label高度
 *
 *
 *  @return label的rect
 */

- (CGFloat)getHeightWithTitle:(NSString *)title font:(UIFont *)font;

/**
 *  由内容与字体大小计算label宽
 */

- (CGRect)getLableHeightWithMaxWidth:(CGFloat)maxWidth;

/**
 *  由内容与字体大小计算label高
 */

- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;


@end
