//
//  CardsModel.m
//  ZYJSVPN
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import "CardsModel.h"

@implementation CardsModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"cid" : @"id",@"activityMoney" : @"new_money"
             };
}

@end
