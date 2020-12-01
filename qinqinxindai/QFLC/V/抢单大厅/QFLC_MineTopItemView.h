//
//  QFLC_MineTopItemView.h
//  ZhuDaiTong
//
//  Created by zrmac on 19.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_MineTopItemView : UIView

@property (nonatomic, copy) void(^jinbiRecord)(void);
@property (nonatomic, copy) void(^rechargeRecord)(void);


- (void)updateMoney;
@end

NS_ASSUME_NONNULL_END
