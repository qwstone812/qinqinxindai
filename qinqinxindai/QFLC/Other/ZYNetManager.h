//
//  ZYNetManager.h
//  HaiXingJieBei
//
//  Created by Miley on 2020/6/3.
//  Copyright © 2020 wyh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYNetManager : NSObject
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
@end

NS_ASSUME_NONNULL_END
