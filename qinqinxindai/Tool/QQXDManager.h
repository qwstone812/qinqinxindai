//
//  QQXDManager.h
//  XJXinDai
//
//  Created by Miley on 2020/11/22.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQXDManager : NSObject

@property (strong, nonatomic)NSArray * orders;
@property (strong, nonatomic)NSArray * zhanYeArr;

+(instancetype)shareInstance;
@property (strong, nonatomic)  NSMutableArray *friendArr;
-(NSDictionary *)findFriendDicWithName:(NSString *)name;

@property (nonatomic,strong)NSMutableArray * weibiRecords;//亲亲币充值消耗记录
@property (nonatomic,strong)NSString * currentWeiBi;//当前亲亲币余额
-(void)increaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason;//增加亲亲币
-(void)decreaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason;//减少亲亲币
-(BOOL)checkWeiBiIsEnoughWithCost:(CGFloat)cost;




@property (nonatomic,strong)NSArray * baseUrls;//父域名数组
@property (nonatomic,strong)NSString * currentServeUrl;//当前接口的域名
@property (nonatomic,assign)NSInteger currentServeUrlFailCount;//当前接口域名请求失败次数，超过10次就自动从父域名更新接口域名
@property (nonatomic,assign)NSInteger baseUrlFailCount;//父域名请求失败次数
@property (nonatomic,assign)BOOL isHaveCheck;//是否完成接口域名检测是否可以请求
@property (nonatomic,strong)NSMutableDictionary * customDefault;//自定义本地存储
@property (nonatomic,strong)NSString * type;//dc、xt、cz、we

+(instancetype)shareManager;
//检查是否有网络状态，有网络状态才去判断是否更新域名
-(void)monitorReachabilityStatus;


- (NSString *)deviceModelName;

@end

NS_ASSUME_NONNULL_END
