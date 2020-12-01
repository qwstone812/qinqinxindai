//
//  QFLC_SZVC.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_SZVC.h"
#import "QFLC_SZCell.h"
#import "QFLC_SZClearCell.h"
//#import "FQJAlertViewBaseStyleView.h"
@interface QFLC_SZVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView *footerView;
//@property (nonatomic,strong)FQJAlertViewBaseStyleView *DCAlert;
@end

@implementation QFLC_SZVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    [self creatUI];
}
- (void)creatUI{
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, WIDTH, HEIGHT-NaviHeight) style:1];
    [self.view addSubview:self.djttableView];
    self.djttableView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    if(@available(iOS 11.0,*)){
        self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.djttableView.tableFooterView = self.footerView;
}
- (UIView *)footerView{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 50)];
        _footerView.backgroundColor = UIWhiteColor;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 50)];
        [_footerView addSubview:btn];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:UIBlackColor forState:UIControlStateNormal];
        btn.titleLabel.font = appFont(16);
        btn.backgroundColor = UIWhiteColor;
        [btn addTarget:self action:@selector(exitLoginClick)];
    }
    return _footerView;
}
#pragma mark - 退出登录
- (void)exitLoginClick{
//    [self.view addSubview:self.DCAlert];
    [Utilities alertWithTitle:@"提示" message:@"您确定要退出登录吗？" ConfirmTitle:@"确定" cancelTitle:@"取消" controller:self Confirm:^{
        [kDefaults removeObjectForKey:DaichaoUserInfoKey];
        [kDefaults synchronize];

        [self.tabBarController setSelectedIndex:0];
        __popToRoot();
        
            //    [kDefaults setObject:@"B" forKey:@"fromType"];
//                [Utilities gotoQFLCLoginWith:self];
    } cancelAction:^{
        
    }];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        QFLC_SZCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDOne"];
        if (!cell) {
            cell = [[QFLC_SZCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIDOne"];
        }
        return cell;
    }else if (indexPath.section == 1){
        QFLC_SZClearCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDTwo"];
        if (!cell) {
            cell = [[QFLC_SZClearCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIDTwo"];
        }
        cell.titleLab.text = @[@"清理缓存",@"注销账号"][indexPath.row];
        if (indexPath.row == 0) {
            float size_m = [self cacheFilesSize]/(1000*1000);
            cell.subLab.text =  [NSString stringWithFormat:@"%.2fM",size_m];
        }else{
//            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//            CFShow((__bridge CFTypeRef)(infoDictionary));
//            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//            cell.subLab.text = [NSString stringWithFormat:@"V%@",app_Version];
        }
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
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
            [self.djttableView reloadData];
        }else if (indexPath.row == 1){
             [Utilities alertWithTitle:@"提示" message:@"您确定要注销账号吗？" ConfirmTitle:@"确定" cancelTitle:@"取消" controller:self Confirm:^{
//                     NSString * str = [kDefaults objectForKey:@"tabbarHeader"];
                                   [kDefaults removeObjectForKey:DaichaoUserInfoKey];
                 [kDefaults synchronize];
                            [self.tabBarController setSelectedIndex:0];
                            __popToRoot();
//                           [kDefaults setObject:str forKey:@"tabbarHeader"];

                       //    [kDefaults setObject:@"B" forKey:@"fromType"];
//                           [Utilities gotoQFLCLoginWith:self];
               } cancelAction:^{
                   
               }];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }else if (section == 1){
        return 44;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 44)];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, KWIDTH-15, 44)];
        lab.text = @"您可在“设置”-“通知”进行更改,关闭将不能收到通知。";
        lab.textColor = rgba(102, 102, 102, 1);
        lab.font = appFont(14);
        [view addSubview:lab];
        return view;
    }
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }else if (section == 1){
        return 30;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
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
