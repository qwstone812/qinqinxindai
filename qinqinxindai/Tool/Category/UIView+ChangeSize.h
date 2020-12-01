//
//  UIView+ChangeSize.h
//  CocoaPodsDemo
//
//  Created by 李晨 on 2017/6/15.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <UIKit/UIKit.h>
//当前设备的宽和320的比例
#define WRATIO [UIScreen mainScreen].bounds.size.width/320

//当前设备的高和480的比例
#define HRATIO [UIScreen mainScreen].bounds.size.height/568

@interface UIView (ChangeSize)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
+(float)setWidth:(float)width;
+(float)setHeight:(float)height;
+(CGRect)setFrame:(CGRect)frame;


@end
