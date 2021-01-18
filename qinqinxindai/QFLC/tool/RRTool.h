//
//  RRTool.h
//  JuZArchive
//
//  Created by czg on 2020/10/12.
//  Copyright © 2020 JH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRTool : NSObject


/** 存储当前用户信息 */
+(BOOL)storeCurrentUserModel:(WTUserInfoModel *)userModel;

/** 获取当前用户信息 */
+ (WTUserInfoModel  *)getCurrentUserModel;


/// 获取订单数量
/// @param orderType 全部 、跟进中 、已签约 、无意向
+ (NSInteger)dyqcgetOrderCountWithType:(NSString *)orderType;



/// 获取品牌数量
/// @param orderType 全部 、跟进中 、已签约 、无意向
+ (NSInteger)dyqcgetOrderCountWithBrand:(NSString *)brand;


/**
 列表无数据时  显示图片、
 
 @param count array.count
 @return 无数据显示图片
 */
+ (UIView *)setTableViewBGViewNeedCount:(NSInteger)count;


/**
 列表数据请求失败时  显示图片、
 
 @return 请求失败显示图片
 */
+ (UIView *)setTableViewErrorBGView;



/// 获取好友列表
+ (NSMutableArray *)getFriendsList;

/// 保存好友列表
/// @param friendsList 好友列表
+ (BOOL)storeFriendsList:(NSMutableArray *)friendsList;



/// 获取充值订单
+ (NSMutableArray *)getOrderList;

/// 保存充值订单
/// @param OrderModel 充值订单
+ (BOOL)storeOrderList:(OrderListModel *)OrderModel;



/// date转字符串
/// @param date 日期
+ (NSString *)getDateStringWithDate:(NSDate *)date;


/// 时间转字符串  yyyy-MM-dd HH:mm
/// @param date 日期   yyyy-MM-dd HH:mm
+ (NSString *)getDateTimeStringWithDate:(NSDate *)date;


/// 日期相加
/// @param date 日期
/// @param days 天数
+ (NSDate *)addDateWithData:(NSDate *)date  Days:(NSInteger )days;



/// 日期相减
/// @param date1 日期1
/// @param date2 日期2
+ (NSString *)subtractWithDate1:(NSDate *)date1 andDate2:(NSDate *)date2;



+ (NSString *)getUUID;

@end

NS_ASSUME_NONNULL_END
