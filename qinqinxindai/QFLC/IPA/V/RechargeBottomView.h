//
//  RechargeBottomView.h
//  ZYJSVPN
//
//  Created by mac on 16.12.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RechargeBottomView : UIView

@property (nonatomic, copy)void(^buyCardBlock)(CardsModel *cardModel);

@property (nonatomic, strong) CardsModel        *cardModel;
@end

NS_ASSUME_NONNULL_END
