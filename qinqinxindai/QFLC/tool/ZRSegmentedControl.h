//
//  ZRSegmentedControl.h
//  DengHaiSeed
//
//  Created by mac on 6.11.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRSegmentedControl : UISegmentedControl


@property (nonatomic, copy) void (^segmentClickBlock)(NSInteger index);


/**
 选中标题颜色
 */
@property (nonatomic, strong) UIColor       *selectedColor;

/**
 默认颜色
 */
@property (nonatomic, strong) UIColor       *normalColor;


/**
 初始化

 @param frame 坐标
 @param titleArr 标题数组
 @return 控制器
 */
- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArr ;

@end

NS_ASSUME_NONNULL_END
