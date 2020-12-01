//
//  QFLC_RechargeCell.h
//  DiShuiManager
//
//  Created by zrmac on 28.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_RechargeCell : UITableViewCell

@property (nonatomic, copy)void(^tapCardsBlock)(NSInteger tag);

@property (nonatomic, strong) NSArray       *cardArray;
@end

NS_ASSUME_NONNULL_END
