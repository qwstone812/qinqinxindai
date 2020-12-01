//
//  OrderCell.h
//  ZYJSVPN
//
//  Created by mac on 17.12.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface OrderCell : UITableViewCell

@property (nonatomic, strong) OrderListModel  *orderModel;

@end

NS_ASSUME_NONNULL_END
