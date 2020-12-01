//
//  OrderListModel.h
//  ZYJSVPN
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderListModel : NSObject

@property (nonatomic, copy)NSString *card_id;
@property (nonatomic, copy)NSString *create_time; //支付时间
@property (nonatomic, copy)NSString *pay_type_name;
@property (nonatomic, copy)NSString *money;
@property (nonatomic, copy)NSString *status; //0 未支付   1  已支付   2  退款

@end

NS_ASSUME_NONNULL_END
