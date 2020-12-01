//
//  QFLC_VIPVC.m
//  DiShuiManager
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_VIPVC.h"

#import "QFLC_VipCell.h"
#import "QFLC_VIPTopCell.h"

@interface QFLC_VIPVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)YDButton  *footerBtn;

@end

@implementation QFLC_VIPVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会员中心";
    [self creatUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)creatUI{
    
    [self.view addSubview:self.footerBtn];
    
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, KWIDTH, self.footerBtn.y-NaviHeight  ) style:1];
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    if(@available(iOS 11.0,*)){
        self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.djttableView.backgroundColor = hexColor(f2f2f2);
    [self.djttableView registerNib:[UINib nibWithNibName:@"QFLC_VipCell" bundle:nil] forCellReuseIdentifier:@"QFLC_VipCell"];
    [self.djttableView registerNib:[UINib nibWithNibName:@"QFLC_VIPTopCell" bundle:nil] forCellReuseIdentifier:@"QFLC_VIPTopCell"];

    [self.view addSubview:self.djttableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
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
    
    
    if (indexPath.section == 1) {
        QFLC_VipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_VipCell"];
        if (!cell) {
            cell = [[QFLC_VipCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_VipCell"];
            cell.backgroundColor =hexColor(f2f2f2);
        }
        return cell;
    }
    
    QFLC_VIPTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_VIPTopCell"];
    if (!cell) {
        cell = [[QFLC_VIPTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_VIPTopCell"];
        cell.backgroundColor =hexColor(f2f2f2);

    }
    WTUserInfoModel * model = [RRTool getCurrentUserModel];

    cell.qflc_daysLab.text = [NSString stringWithFormat:@"到期时间%@",[RRTool getDateStringWithDate:model.huiyuanDays]];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 900;
    }
    if (![Utilities checkIsLogin]) {
        return 0.01;
    }
    return 135;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark -action

- (void)qflcBuyClick{
    
    if (![Utilities checkIsLogin]) {
        [Utilities gotoQFLCLoginWith:self];
        return;
    }
    __pushWithClassName(@"QFLC_IPAVC");
}

#pragma mark --lazy
- (YDButton *)footerBtn{
    if (!_footerBtn) {
        _footerBtn = [YDButton buttonWithFrame:CGRectMake(20, KHEIGHT-SafeAreaBottomHeight - 50, KWIDTH-40, 50) title:@"购买会员"];
       [_footerBtn setTitleColor:UIWhiteColor];
       [_footerBtn setBgColor:ThemeColor];
   //    logoutBtn.titleLabel.font=[UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
       [_footerBtn addTarget:self action:@selector(qflcBuyClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerBtn;
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
