//
//  RRTool.m
//  JuZArchive
//
//  Created by czg on 2020/10/12.
//  Copyright © 2020 JH. All rights reserved.
//

#import "RRTool.h"

@implementation RRTool



/** 存储当前用户信息 */
+(BOOL)storeCurrentUserModel:(WTUserInfoModel *)userModel{
    
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"account.archive"];
    //存进沙盒 自定义对象的存储必须用NSKeyedArchiver，
    BOOL choose = [NSKeyedArchiver archiveRootObject:userModel toFile:path];
    return choose;
}

/** 获取当前用户信息 */
+ (WTUserInfoModel  *)getCurrentUserModel{
    // 取出对象沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"account.archive"];
    
    id   userModel = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (!userModel) {
        userModel = [WTUserInfoModel new];
    }
    
    return userModel;
}

/// 获取订单数量
/// @param orderType 全部 、跟进中 、已签约 、无意向
+ (NSInteger)dyqcgetOrderCountWithType:(NSString *)orderType{
    NSInteger count = 0;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DSMOrder"];
    NSArray * temp = [ManageObject executeFetchRequest:request error:nil];
    
    if ([orderType isEqualToString:@"全部"]) {
        return temp.count;
    }
    
    for (DSMOrder * cus  in temp) {
        if([cus.status isEqualToString:orderType]){
            count++;
        }
    }
    return  count;
}


/// 获取品牌数量
/// @param brand 全部 、跟进中 、已签约 、无意向
+ (NSInteger)dyqcgetOrderCountWithBrand:(NSString *)brand{
    NSInteger count = 0;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DSMOrder"];
    NSArray * temp = [ManageObject executeFetchRequest:request error:nil];
//    for (DSMOrder * cus  in temp) {
//        if([cus.brand isEqualToString:brand]){
//            count++;
//        }
//    }
    return  count;
}




/// 获取好友列表
+ (NSMutableArray *)getFriendsList{
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"friendsList.archive"];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

/// 保存好友列表
/// @param friendsList 好友列表
+ (BOOL)storeFriendsList:(NSMutableArray *)friendsList{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"friendsList.archive"];
    //存进沙盒 自定义对象的存储必须用NSKeyedArchiver，
    BOOL choose = [NSKeyedArchiver archiveRootObject:friendsList toFile:path];
    return choose;
}



/// 获取充值订单
+ (NSMutableArray *)getOrderList{
    // 沙盒路径
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"OrderList.archive"];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

/// 保存充值订单
/// @param OrderModel 充值订单
+ (BOOL)storeOrderList:(OrderListModel *)OrderModel{
    
    //取出充值订单
    NSMutableArray  * orderList = [NSMutableArray arrayWithArray:[self getOrderList]];
    [orderList addObject:OrderModel];
    
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [doc stringByAppendingPathComponent:@"OrderList.archive"];
    //存进沙盒 自定义对象的存储必须用NSKeyedArchiver，
    BOOL choose = [NSKeyedArchiver archiveRootObject:orderList toFile:path];
    return choose;
}






/**
 列表无数据时  显示图片、

 @param count array.count
 @return 无数据显示图片
 */
+ (UIView *)setTableViewBGViewNeedCount:(NSInteger)count{
    if (count) {
        return nil;
    }else{
        
//        UILabel * noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, KSCREEN_WIDTH, 44)];
//        noDataLabel.text = @"暂无数据";
//        noDataLabel.textColor = [MTool colorWithHexString:@"#353333"];
//        noDataLabel.textAlignment = NSTextAlignmentCenter;
//        noDataLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(16.0)];
//
//        return noDataLabel;
        
        UIView * bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 200)];
        bg.backgroundColor = UIClearColor;
        UIImage * image = [UIImage imageNamed:@"nodata_icon"];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
        imgView.contentMode = UIViewContentModeCenter;
        imgView.frame = CGRectMake(KSCREEN_WIDTH/2 - image.size.width/2, 100 - image.size.height/2, image.size.width, image.size.height);
        [bg addSubview:imgView];
        
        return bg;
        
       
        return imgView;
    }
}

/**
 列表数据请求失败时  显示图片、
 
 @return 请求失败显示图片
 */
+ (UIView *)setTableViewErrorBGView{
    
    UIView * bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 200)];
    
    UIImage * image = [UIImage imageNamed:@"error_icon"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    imgView.contentMode = UIViewContentModeCenter;
    imgView.frame = CGRectMake(KSCREEN_WIDTH/2 - image.size.width/2, 100 - image.size.height/2, image.size.width, image.size.height);
    [bg addSubview:imgView];
    
    
    
    return bg;
}



/// date转字符串
/// @param date 日期
+ (NSString *)getDateStringWithDate:(NSDate *)date{
   NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
   return strDate;
}

/// 时间转字符串
/// @param date 日期
+ (NSString *)getDateTimeStringWithDate:(NSDate *)date{
   NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
   return strDate;
}


/// 日期相加
/// @param date 日期
/// @param days 天数
+ (NSDate *)addDateWithData:(NSDate *)date  Days:(NSInteger )days{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    NSTimeInterval interval = 60 * 60 *24* days;
    NSDate * daoqi = [[NSDate alloc] initWithTimeInterval:interval sinceDate:date];
    return daoqi;
}



/// 日期相减
/// @param date1 日期1
/// @param date2 日期2
+ (NSString *)subtractWithDate1:(NSDate *)date1 andDate2:(NSDate *)date2{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    unsigned int unitFlags = NSCalendarUnitDay;//年、月、日、时、分、秒、周等等都可以

    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date1 toDate:date2 options:0];
    NSInteger days = [comps day];//时间差
    
    return [NSString stringWithFormat:@"%ld",days];
}

@end
