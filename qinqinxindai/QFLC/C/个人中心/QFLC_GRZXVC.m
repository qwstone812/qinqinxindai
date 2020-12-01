//
//  QFLC_GRZXVC.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_GRZXVC.h"
#import "qflc_grzxTopCell.h"

#import "QFLC_SZVC.h"
#import "QFLC_GYWMVC.h"
#import "QFLC_RechargeList.h"
#import "QFLC_jinbiListVC.h"
#import "QFLC_XieyiVC.h"
@interface QFLC_GRZXVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray * tableItems;
@property (nonatomic,strong)UIView  * footerView;

@end

@implementation QFLC_GRZXVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableItems = @[@"隐私协议",@"关于我们",@"联系客服",@"清除缓存"];

    [self creatUI];
    
   
    
}
- (void)creatUI{
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT  - TabbarHeight) style:1];
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    if(@available(iOS 11.0,*)){
        self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    self.djttableView.tableFooterView = self.footerView;
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.djttableView.backgroundColor = hexColor(f2f2f2);
    [self.view addSubview:self.djttableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1){
        return _tableItems.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        qflc_grzxTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[qflc_grzxTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        }
        
        WTUserInfoModel * model = [RRTool getCurrentUserModel];
        if (model.localAvatar) {
            cell.txImgV.image = [UIImage imageWithContentsOfFile:model.localAvatar];
        }else{
            cell.txImgV.image = [ UIImage imageNamed:@"touxiang"];
        }
        
        cell.vipLab.text = [NSString stringWithFormat:@"钻石会员(%@天)",[RRTool subtractWithDate1:[NSDate date] andDate2:model.huiyuanDays]];
        [cell.txImgV addTarget:self action:@selector(toLogin)];
        [cell.setImgV addTarget:self action:@selector(SZCLick)];
        
        [cell.itemView updateMoney];
        cell.itemView.jinbiRecord = ^{
            [self dxg_jinbiListClick];
        };
        cell.itemView.rechargeRecord = ^{
            [self dxg_rechargeListClick];
        };
        
        if (![Utilities checkIsLogin]) {
            cell.nameLab.text = @"请先登录！";
        }else{
            cell.nameLab.text = NICKNAME;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        NSString * tableItem = _tableItems[indexPath.row];
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString * str = tableItem;
        cell.textLabel.text = str;
        cell.textLabel.font = appFont(15);
        cell.detailTextLabel.font = appFont(12);
        cell.detailTextLabel.textColor = hexColor(999999);
        if ([tableItem isEqualToString:@"清除缓存"]) {
            float size_m = [self cacheFilesSize]/(1000*1000);
            cell.detailTextLabel.text =  [NSString stringWithFormat:@"%.2fM",size_m];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 230;
    }else {
        return 70;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
//    if (indexPath.section == 0) {
//        __pushWithClassName(@"DWPersonVC");
//        return;
//    }
    if(indexPath.section == 1){
         NSString * tableItem = _tableItems[indexPath.row];
           if([tableItem isEqualToString:@"关于我们"]){
               [self dxg_GYWMCLick];
           }else if([tableItem isEqualToString:@"隐私协议"]){
               [self dxg_YSXYCLick ];
               
           }
          else if([tableItem isEqualToString:@"清除缓存"]){
                NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
                NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                NSLog(@"files :%lu",(unsigned long)[files count]);
                for (NSString *p in files) {
                    NSError *error;
                    NSString *path = [cachPath stringByAppendingPathComponent:p];
                    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                    }
                }
                [self.view makeToast:@"清除缓存成功"];
                [tableView reloadData];
            }else if([tableItem isEqualToString:@"退出登录"]){
                [Utilities alertWithTitle:@"提示" message:@"您确定要注销账号吗？" ConfirmTitle:@"确定" cancelTitle:@"取消" controller:self Confirm:^{
                    //              NSString * str = [kDefaults objectForKey:@"tabbarHeader"];
                    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
                    
                    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
                    [self.tabBarController setSelectedIndex:0];
                    [Utilities gotoQFLCLoginWith:self];
                } cancelAction:^{
                    
                }];
            }else if([tableItem isEqualToString:@"联系客服"]){
                [Utilities callPhone:@"4005746388"];
            }
    }
}

#pragma mark -- cache
- (float)cacheFilesSize
{
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager* manager = [NSFileManager defaultManager];
    //    SFun_Log(@"cachPath = %@",cachPath);
    if (![manager fileExistsAtPath:cachPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:cachPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [cachPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
- (long long) fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
    
}

#pragma mark -Action  去登录
- (void)toLogin{
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
}


#pragma mark - 亲亲币记录
-(void)dxg_jinbiListClick{
    
    __pushWithClassName(@"QFLC_jinbiListVC");
}

#pragma mark - 我的二维码
- (void)dxg_rechargeListClick{
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
    __pushWithClassName(@"QFLC_RechargeList");
}


#pragma mark - 联系我们
- (void)dxg_LXWMCLick{
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"400-113-6034"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

#pragma mark - 关于我们
- (void)dxg_GYWMCLick{
    QFLC_GYWMVC *target = [[QFLC_GYWMVC alloc]init];
    target.hidesBottomBarWhenPushed = YES;
    __push(target);
}
#pragma mark - 隐私协议
- (void)dxg_YSXYCLick{
    QFLC_XieyiVC * target = [[QFLC_XieyiVC alloc]init];
    target.url = @"http://qqxd.sylctec.cn/private.html";
    target.titleStr = @"隐私注册协议";
    target.hidesBottomBarWhenPushed = YES;
    __push(target);

}



#pragma mark - 设置
- (void)SZCLick{
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
    __pushWithClassName(@"QFLC_IPAVC");
}
#pragma mark - tuichu

- (void)logoutClick{
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
    
    [Utilities alertWithTitle:@"提示" message:@"您确定要注销账号吗？" ConfirmTitle:@"确定" cancelTitle:@"取消" controller:self Confirm:^{
        //              NSString * str = [kDefaults objectForKey:@"tabbarHeader"];
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [self.tabBarController setSelectedIndex:0];
        //                    [kDefaults setObject:str forKey:@"tabbarHeader"];
        
        //    [kDefaults setObject:@"B" forKey:@"fromType"];
        [Utilities gotoQFLCLoginWith:self];
    } cancelAction:^{
        
    }];
}


#pragma mark --lazy
- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 80)];
        YDButton * _footerBtn = [YDButton buttonWithFrame:CGRectMake(20, 15, KWIDTH-40, 50) title:@"退出登录"];
       [_footerBtn setTitleColor:UIWhiteColor];
       [_footerBtn setBgColor:ThemeColor];
   //    logoutBtn.titleLabel.font=[UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
       [_footerBtn addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:_footerBtn];
    }
    return _footerView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.leftBarButtonItem = nil;
    [self.djttableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
