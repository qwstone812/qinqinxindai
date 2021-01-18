//
//  ZYNetManager.m
//  HaiXingJieBei
//
//  Created by Miley on 2020/6/3.
//  Copyright © 2020 wyh. All rights reserved.
//

#import "ZYNetManager.h"
#define kDefaultServerUrl @"https://api.xindaibaogao.com"//默认接口域名
#define ServerUrlUserDefaultKey @"ServerUrlUserDefaultKey"//保存接口域名的key
#define LastUpdateServerUrlKey @"LastUpdateServerUrlKey"//保存更新时间的key
#define LocalPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]stringByAppendingPathComponent:@"ZYServerConfig.plist"] // 沙盒存储路径
#define autoRefeshDay 30 //自动更新天数：30天

static ZYNetManager *_singleInstance = nil;

@implementation ZYNetManager

+(instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleInstance == nil) {
            _singleInstance = [[self alloc]init];
            _singleInstance.baseUrlFailCount = 0;
            _singleInstance.currentServeUrlFailCount = 0;
            _singleInstance.isHaveCheck = NO;
            _singleInstance.type = @"dc";
        }
    });
    return _singleInstance;
}
-(NSString *)currentServeUrl{
    if ([self.customDefault objectForKey:ServerUrlUserDefaultKey] && [[[self.customDefault objectForKey:ServerUrlUserDefaultKey]description]containsString:@"http"]) {
        return [[self.customDefault objectForKey:ServerUrlUserDefaultKey]description];
    }else{
        return kDefaultServerUrl;
    }
}
-(NSArray *)baseUrls{
    if (!_baseUrls) {
        _baseUrls = @[@"http://a.lxtaiguo.com",@"http://dns.51jshc.com",@"http://dns.bjdsdx.com",@"http://a.dagongbaba.com"];
    }
    return _baseUrls;
}

-(void)checkCurrentUrlEnable{
    
    MJWeakSelf;
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN || [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi) {
        if ([self.customDefault objectForKey:ServerUrlUserDefaultKey] && [[[self.customDefault objectForKey:ServerUrlUserDefaultKey]description]containsString:@"http"]) {//如果已经有了接口域名，则判断更新时间和接口域名是否可以请求
            if ([self intervalFromLastDate:[self.customDefault objectForKey:LastUpdateServerUrlKey] toTheDate:[NSDate date]] >= autoRefeshDay * 60 * 60 * 24)
            {//如果距离上一次刷新时间大于自动刷新周期，则更新一次域名
//                NSLog(@"%@",self.customDefault);
                [self refreshServer];
            }else{//如果没到自动刷新时间，就判断当前域名是否可用，可用就可以不用管了，失败10次代表不可用，则更新一次域名
                if (_currentServeUrlFailCount < 10) {
                    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
                    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
                    [manager POST:[NSString stringWithFormat:@"%@/v3/channel/go",self.currentServeUrl] parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
                        weakSelf.isHaveCheck = YES;
                        //如果请求成功，跳出递归，不用更新接口域名
                        return;
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        weakSelf.currentServeUrlFailCount ++;
                        if (weakSelf.currentServeUrlFailCount < 10) {//如果请求失败次数小于10，再检验
                            [weakSelf checkCurrentUrlEnable];
                        }else{
                            //失败次数超过10次，更新接口域名
                            [weakSelf refreshServer];
                        }
                    }];
                }
            }
        }else{//如果还没有域名，则进行第一次更新域名
            [self refreshServer];
        }
    }
}
//更新接口域名
-(void)refreshServer{
    if (_baseUrlFailCount < self.baseUrls.count) {
        NSString * urlStr = [NSString stringWithFormat:@"%@/%@",self.baseUrls[_baseUrlFailCount],self.type];
        MJWeakSelf
        AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
        [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
            NSString * str  =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            [weakSelf.customDefault setObject:str forKey:ServerUrlUserDefaultKey];
            [weakSelf.customDefault setObject:[NSDate date] forKey:LastUpdateServerUrlKey];
            [weakSelf.customDefault writeToFile:LocalPath atomically:YES];
            //请求成功，更新接口域名和域名更新时间，跳出递归
            return;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //请求失败就进行下一个主域名的请求
            weakSelf.baseUrlFailCount ++;
            [weakSelf refreshServer];
        }];
    }
}
- (void)monitorReachabilityStatus
{
    // 开始监测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    // 网络状态改变的回调
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                [self checkCurrentUrlEnable];
                [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
                NSLog(@"蜂窝网络");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                [self checkCurrentUrlEnable];
                [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
                NSLog(@"WIFI");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            default:
                break;
        }
    }];
}
-(NSMutableDictionary *)customDefault{
    if (!_customDefault) {
        _customDefault = [NSMutableDictionary dictionaryWithContentsOfFile:LocalPath];
        if (!_customDefault) {
            _customDefault = [NSMutableDictionary dictionary];
            [_customDefault writeToFile:LocalPath atomically:YES];
        }
    }
    return _customDefault;
}
- (NSTimeInterval)intervalFromLastDate:(NSDate *)d1 toTheDate:(NSDate *)d2
{
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    NSTimeInterval cha=late2-late1;
    return cha;
}

@end
