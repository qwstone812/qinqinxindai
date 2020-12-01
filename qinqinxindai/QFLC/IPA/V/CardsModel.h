//
//  CardsModel.h
//  ZYJSVPN
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardsModel : NSObject



/// 1=买一送一  2=订阅首冲半价  3=半价折扣
@property (nonatomic, copy)NSString *card_type;


@property (nonatomic, copy)NSString *cid;

@property (nonatomic, copy)NSString *today;

@property (nonatomic, copy)NSString *type;

/// 原价
@property (nonatomic, copy)NSString *money;

/// 活动价格
@property (nonatomic, copy)NSString *activityMoney;


//加速时长
@property (nonatomic, copy)NSString *months;
@property (nonatomic, copy)NSString *days;

@property (nonatomic, assign)BOOL isChoose;

@end

NS_ASSUME_NONNULL_END
