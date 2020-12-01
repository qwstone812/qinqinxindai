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

static QQXDManager *_singleInstance = nil;

@implementation QQXDManager
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_singleInstance == nil) {
            _singleInstance = [[self alloc]init];
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
        cus.date = @"2020-12-01";
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
        cus1.date = @"2020-12-01";
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
        cus3.date = @"2020-12-01";
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
        cus4.date = @"2020-11-30";
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
        cus5.date = @"2020-12-02";
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
        cus6.date = @"2020-12-02";
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
        cus7.date = @"2020-12-02";
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
@end
