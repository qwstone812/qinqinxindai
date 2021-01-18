//
//  QQXDManager.m
//  XJXinDai
//
//  Created by Miley on 2020/11/22.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QQXDManager.h"
#import "QFLC_IPAVC.h"
#import "QFLC_TabBarVC.h"
#import <sys/utsname.h>


#define kDefaultServerUrl @"https://api.xindaibaogao.com"//默认接口域名
#define ServerUrlUserDefaultKey @"ServerUrlUserDefaultKey"//保存接口域名的key
#define LastUpdateServerUrlKey @"LastUpdateServerUrlKey"//保存更新时间的key
#define LocalPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]stringByAppendingPathComponent:@"ZYServerConfig.plist"] // 沙盒存储路径
#define autoRefeshDay 30 //自动更新天数：30天

static QQXDManager *_singleInstance = nil;

@implementation QQXDManager
+(instancetype)shareInstance
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
-(NSArray *)zhanYeArr{
    if (!_zhanYeArr) {
        _zhanYeArr = @[@{@"image":@"img-1",@"title":@"资金周转请找我",@"count":@"54"},@{@"image":@"img-2",@"title":@"资金周转请找我",@"count":@"32"},@{@"image":@"img-3",@"title":@"资金周转请找我",@"count":@"78"},@{@"image":@"img-4",@"title":@"资金周转请找我",@"count":@"5"},@{@"image":@"img-5",@"title":@"资金周转请找我",@"count":@"67"},@{@"image":@"img-6",@"title":@"资金周转请找我",@"count":@"45"},@{@"image":@"img-7",@"title":@"资金周转请找我",@"count":@"32"},@{@"image":@"img-8",@"title":@"资金周转请找我",@"count":@"12"},@{@"image":@"img-9",@"title":@"资金周转请找我",@"count":@"24"},@{@"image":@"img-10",@"title":@"资金周转请找我",@"count":@"34"}];
    }
    return _zhanYeArr;
}
-(NSMutableArray *)orders{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"DSMOrder"];
    _orders = [ManageObject executeFetchRequest:request error:nil];
    if (_orders.count <= 0) {
        DSMOrder * cus = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus.name = @"孙女士";
        cus.phone = @"15184756091";
        cus.money = @"30000";
        cus.term = @"12";
        cus.job = @"自由职业";
        cus.age = @"18";
        cus.gender = @"女";
        cus.gongjijin = @"无本地公积金";
        cus.shebao = @"无本地社保";
        cus.salary = @"12000";
        cus.discount = @"8折";
        cus.cost = @"24";
        cus.purpose = @"临时周转";
        cus.date = @"2020-12-23";
        cus.city = @"北京";
        cus.labels = @"北京市  |  有房  |  有车";
        cus.status = @"0";
        
        DSMOrder * cus1 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus1.name = @"王先生";
        cus1.phone = @"15684756011";
        cus1.money = @"200000";
        cus1.term = @"6";
        cus1.job = @"上班族";
        cus1.age = @"22";
        cus1.date = @"2020-12-03";
        cus1.gender = @"男";
        cus1.gongjijin = @"连续缴纳3个月";
        cus1.shebao = @"连续缴纳3个月";
        cus1.salary = @"10000";
        //            cus1.discount = @"8折";
        cus1.cost = @"30";
        cus1.purpose = @"旅游";
        cus1.city = @"北京";
        cus1.labels = @"北京市  |  有社保  |  有公积金  |  有房  |  有车";
        cus1.status = @"0";
        
        DSMOrder * cus2 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus2.name = @"李先生";
        cus2.phone = @"15684756374";
        cus2.money = @"100000";
        cus2.term = @"18";
        cus2.job = @"个体户";
        cus2.age = @"30";
        cus2.gender = @"男";
        cus2.gongjijin = @"连续缴纳12个月";
        cus2.shebao = @"连续缴纳12个月";
        cus2.salary = @"20000";
        //            cus1.discount = @"8折";
        cus2.date = @"2020-12-28";
        cus2.cost = @"30";
        cus2.purpose = @"装修";
        cus2.city = @"北京";
        cus2.labels = @"北京市  |  有社保  |  有公积金  |  有房  |  有车";
        cus2.status = @"0";
        
        DSMOrder * cus3 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus3.name = @"张女士";
        cus3.phone = @"15684756374";
        cus3.money = @"50000";
        cus3.term = @"24";
        cus3.job = @"个体户";
        cus3.age = @"28";
        cus3.gender = @"女";
        cus3.date = @"2020-12-03";
        cus3.gongjijin = @"连续缴纳12个月";
        cus3.shebao = @"连续缴纳12个月";
        cus3.salary = @"15000";
        //            cus1.discount = @"8折";
        cus3.cost = @"30";
        cus3.purpose = @"装修";
        cus3.city = @"北京";
        cus3.labels = @"北京市  |  有社保  |  有公积金  |  有房  |  有车";
        cus3.status = @"0";
        [[Utilities appDelegate]saveContext];
        
        
        DSMOrder * cus4 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus4.name = @"刘先生";
        cus4.phone = @"15184756091";
        cus4.money = @"50000";
        cus4.term = @"24";
        cus4.job = @"上班族";
        cus4.age = @"18";
        cus4.gender = @"男";
        cus4.gongjijin = @"无本地公积金";
        cus4.shebao = @"无本地社保";
        cus4.salary = @"10000";
//        cus.discount = @"";
        cus4.cost = @"24";
        cus4.purpose = @"临时周转";
        cus4.date = @"2020-12-27";
        cus4.city = @"北京";
        cus4.labels = @"北京市  |  有房  |  有车  |  有公积金" ;
        cus4.status = @"0";
        
        
        DSMOrder * cus5 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus5.name = @"王女士";
        cus5.phone = @"15184756091";
        cus5.money = @"80000";
        cus5.term = @"12";
        cus5.job = @"个体";
        cus5.age = @"28";
        cus5.gender = @"女";
        cus5.gongjijin = @"无本地公积金";
        cus5.shebao = @"无本地社保";
        cus5.salary = @"20000";
        cus5.discount = @"8折";
        cus5.cost = @"24";
        cus5.purpose = @"临时周转";
        cus5.date = @"2020-12-31";
        cus5.city = @"北京";
        cus5.labels = @"北京市  |  有房  |  有车";
        cus5.status = @"0";
        
        DSMOrder * cus6 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus6.name = @"孔先生";
        cus6.phone = @"15184756091";
        cus6.money = @"200000";
        cus6.term = @"36";
        cus6.job = @"上班族";
        cus6.age = @"38";
        cus6.gender = @"女";
        cus6.gongjijin = @"无本地公积金";
        cus6.shebao = @"无本地社保";
        cus6.salary = @"21000";
//        c6us.discount = @"8折";
        cus6.cost = @"24";
        cus6.purpose = @"临时周转";
        cus6.date = @"2020-12-30";
        cus6.city = @"北京";
        cus6.labels = @"北京市  |  有房  |  有车  |  有社保  |  有公积金";
        cus6.status = @"0";
        
        DSMOrder * cus7 = [NSEntityDescription  insertNewObjectForEntityForName:@"DSMOrder"  inManagedObjectContext:ManageObject];
        cus7.name = @"陈女士";
        cus7.phone = @"15184756091";
        cus7.money = @"130000";
        cus7.term = @"12";
        cus7.job = @"自由职业";
        cus7.age = @"31";
        cus7.gender = @"女";
        cus7.gongjijin = @"无本地公积金";
        cus7.shebao = @"无本地社保";
        cus7.salary = @"12000";
        cus7.discount = @"8折";
        cus7.cost = @"24";
        cus7.purpose = @"临时周转";
        cus7.date = @"2020-12-31";
        cus7.city = @"北京";
        cus7.labels = @"北京市  |  有房  |  有车";
        cus7.status = @"0";
        _orders = [ManageObject executeFetchRequest:request error:nil];
    }
    return _orders;
}
-(NSMutableArray *)friendArr{
    if (!_friendArr) {
        _friendArr = [@[@{@"name":@"王东",@"phone":@"17710384602",@"tx":@"txl1",@"loc":@"广州市天河外国语学校",@"log":@"113.305288",@"lat":@"23.190065"},@{@"name":@"郭碧婷",@"phone":@"15600345678",@"tx":@"txl2",@"loc":@"天河区黄埔大道维加斯广场",@"log":@"113.333818",@"lat":@"23.131021"},@{@"name":@"赵云浩",@"phone":@"17710384604",@"tx":@"txl3",@"loc":@"天河区黄埔大道维加斯广场",@"log":@"113.333818",@"lat":@"23.131021"},@{@"name":@"李胜男",@"phone":@"13264717364",@"tx":@"txl4",@"loc":@"龙口西路伊顿国际商务中心",@"log":@"113.342873",@"lat":@"23.143915"}] mutableCopy];
    }
    return  _friendArr;
}
-(NSDictionary *)findFriendDicWithName:(NSString *)name{
    for (NSDictionary * dic in self.friendArr) {
        if ([[dic[@"name"]description] isEqualToString:name]) {
            return dic;
        }
    }
    return nil;
}


-(NSString *)currentWeiBi{
    if (!_currentWeiBi) {
        if ([kDefaults objectForKey:@"weibicount"]) {
            _currentWeiBi = [kDefaults objectForKey:@"weibicount"];
        }else{
            _currentWeiBi = @"0.00";
            [kDefaults setObject:_currentWeiBi forKey:@"weibicount"];
            [kDefaults synchronize];
        }
    }
    return _currentWeiBi;
}
//增加亲亲币
-(void)increaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason{
    self.currentWeiBi = [NSString stringWithFormat:@"%.2f",([self.currentWeiBi floatValue]+amount)];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject: [NSString stringWithFormat:@"%.2f",amount] forKey:@"money"];
    [dic setObject: reason forKey:@"reason"];
    [dic setObject: @"+" forKey:@"type"];
    [dic setObject:[Utilities getCurrentDateString] forKey:@"date"];
    [self.weibiRecords addObject:dic];
    [kDefaults setObject:self.currentWeiBi forKey:@"weibicount"];
    [kDefaults setObject:self.weibiRecords forKey:@"weibiRecord"];
    [kDefaults synchronize];
}
//减少亲亲币
-(void)decreaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason{
    self.currentWeiBi = [NSString stringWithFormat:@"%.2f",([self.currentWeiBi floatValue]-amount)];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setObject: [NSString stringWithFormat:@"%.2f",amount] forKey:@"money"];
    [dic setObject: reason forKey:@"reason"];
    [dic setObject: @"-" forKey:@"type"];
    [dic setObject:[Utilities getCurrentDateString] forKey:@"date"];
    [self.weibiRecords addObject:dic];
    [kDefaults setObject:self.currentWeiBi forKey:@"weibicount"];
    [kDefaults setObject:self.weibiRecords forKey:@"weibiRecord"];
    [kDefaults synchronize];
}
-(BOOL)checkWeiBiIsEnoughWithCost:(CGFloat)cost{
    if ([self.currentWeiBi floatValue] >= cost) {
        return YES;
    }else{
        [Utilities alertWithTitle:@"亲亲币余额不足" message:[NSString stringWithFormat:@"您的余额为%@，本次消耗需要%.2f亲亲币，余额不足，是否去充值?",self.currentWeiBi,cost] ConfirmTitle:@"去充值" cancelTitle:@"再看看" controller:[UIApplication sharedApplication].keyWindow.rootViewController Confirm:^{
            QFLC_IPAVC * target = [[QFLC_IPAVC alloc]init];
            UINavigationController * nav = [QFLC_TabBarVC sharedDYQCTabBarVC].selectedViewController;
            [nav pushViewController:target animated:YES];
        } cancelAction:^{
            
        }];
        return NO;
    }
    
}
-(NSMutableArray *)weibiRecords{
    if (!_weibiRecords) {
        if ([kDefaults objectForKey:@"weibiRecord"]) {
            _weibiRecords = [[kDefaults objectForKey:@"weibiRecord"]mutableCopy];
        }else{
            _weibiRecords = [NSMutableArray array];
            [kDefaults setObject:_weibiRecords forKey:@"weibiRecord"];
             [kDefaults synchronize];
        }
    }
    return _weibiRecords;
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


- (NSString *)deviceModelName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"]) return @"Verizon iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"]) return @"iPhone 7";//国行、日版、港行
    if ([deviceModel isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";//港行、国行
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";//美版、台版
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";//美版、台版
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone 8";//国行(A1863)、日行(A1906)
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";//美版(Global/A1905)
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";//国行(A1864)、日行(A1898)
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";//美版(Global/A1897)
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";//国行(A1865)、日行(A1902)
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";//美版(Global/A1901)
    if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([deviceModel isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"]) return @"iPad 2 (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"]) return @"iPad 2 (32nm)";
    if ([deviceModel isEqualToString:@"iPad2,5"]) return @"iPad mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"]) return @"iPad mini (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"]) return @"iPad mini (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad3,1"]) return @"iPad 3(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"]) return @"iPad 3(CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"]) return @"iPad 3(4G)";
    if ([deviceModel isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"]) return @"iPad 4 (4G)";
    if ([deviceModel isEqualToString:@"iPad3,6"]) return @"iPad 4 (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"i386"]) return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"]) return @"Simulator";
    
    if ([deviceModel isEqualToString:@"iPad4,4"]
        ||[deviceModel isEqualToString:@"iPad4,5"]
        ||[deviceModel isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    
    if ([deviceModel isEqualToString:@"iPad4,7"]
        ||[deviceModel isEqualToString:@"iPad4,8"]
        ||[deviceModel isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    
    return deviceModel;
}

@end
