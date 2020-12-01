//
//  rechargeButton.h
//  ZYJSVPN
//
//  Created by mac on 2019/1/15.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface rechargeButton : UIView
/// 优惠活动类型  1=买一送一  2=订阅首冲半价  3=半价折扣
@property (nonatomic, strong)NSString * discountsType;


@property (nonatomic, copy)NSString *money;

@property (nonatomic, copy)NSString *today;

@property (nonatomic, assign)BOOL selected;

@property (nonatomic, copy)NSString *cid;

///**
// 按钮的点击事件
//
// @param sender 按钮
// */
//- (void)selectButton:(void(^)(rechargeButton *btu))sender;

@end

NS_ASSUME_NONNULL_END
