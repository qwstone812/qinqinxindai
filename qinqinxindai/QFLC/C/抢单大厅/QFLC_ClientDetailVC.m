//
//  QFLC_ClientDetailVC.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientDetailVC.h"
#import "QFLC_ClientTopCell.h"
#import "QFLC_ClientDataCell.h"
#import "FunctionModel.h"


@interface QFLC_ClientDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIView  * footerView;
@property (nonatomic,strong)YDButton  *footerBtn;
@end

@implementation QFLC_ClientDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    [self resetBtnTitle];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.navigationItem.leftBarButtonItem = nil;
}



- (void)creatUI{
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT ) style:1];
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    if(@available(iOS 11.0,*)){
        self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.djttableView.backgroundColor = hexColor(f2f2f2);
    self.djttableView.tableFooterView = self.footerView;
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
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        QFLC_ClientTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_MineTopCell"];
        if (!cell) {
            cell = [[QFLC_ClientTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_MineTopCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.dataView.numLab1.text =     [NSString stringWithFormat:@"%ld",_order.money.integerValue/10000];

        cell.dataView.numLab2.text = _order.term;
        cell.dataView.numLab3.text = _order.purpose;
        cell.nameLab.text = [NSString  stringWithFormat:@" %@  电话：******",_order.name];
        [cell.backImV addTarget:self action:@selector(qflc_backClick)];
        [cell.callImV addTarget:self action:@selector(qflc_callClick)];

        return cell;
    }else if (indexPath.section == 1){
        
        QFLC_ClientDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ClientDataCell"];
        if (!cell) {
            cell = [[QFLC_ClientDataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_ClientDataCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        cell.cityView.contentLab.text = _order.city;
        cell.ageView.contentLab.text = _order.age;
        cell.dateView.contentLab.text = _order.date;
        cell.jobView.contentLab.text = _order.job;
        cell.incomeView.contentLab.text = _order.salary;

        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 250;
    }else {
        return 280;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (void)qflc_backClick{
    __pop();
}

- (void)qflc_callClick{
    [Utilities callPhone:[NSString stringWithFormat:@"400-193-4958-%d",arc4random()%10]];
}

- (void)qflceditStatusClick{
    
    ZRAlertController *alert = [ZRAlertController initZRAlerControllerWithTitle:@"" message:@"请选择客户状态" style:@"0" titleArr:@[@"未联系",@"已联系，跟进中",@"已多次拨打电话，未接通",@"取消"] alerAction:^(NSString * itemStr, NSInteger index) {
//        self.footerBtn.ydTitle = itemStr;
        self.order.status = [NSString stringWithFormat:@"%ld",index + 1];
        [[Utilities appDelegate]saveContext];
        [Utilities delay:0.3 view:self.view action:^{
            [self resetBtnTitle];
        }];
        
    }];
    [alert showWBAler];
}

-(void)resetBtnTitle{
    if ([_order.status isEqualToString:@"0"]) {
        [_footerBtn setTitle:@"暂未抢单" forState:UIControlStateNormal];
    }else if ([_order.status isEqualToString:@"1"]) {
        [_footerBtn setTitle:@"未联系" forState:UIControlStateNormal];
    }else if ([_order.status isEqualToString:@"2"]) {
        [_footerBtn setTitle:@"已联系，跟进中" forState:UIControlStateNormal];
    }else if ([_order.status isEqualToString:@"3"]) {
        [_footerBtn setTitle:@"已多次拨打电话，未接通" forState:UIControlStateNormal];
    }
}

#pragma mark --lazy
- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 80)];
        _footerBtn = [YDButton buttonWithFrame:CGRectMake(20, 15, KWIDTH-40, 50) title:@"未联系"];
       [_footerBtn setTitleColor:UIWhiteColor];
       [_footerBtn setBgColor:ThemeColor];
   //    logoutBtn.titleLabel.font=[UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
       [_footerBtn addTarget:self action:@selector(qflceditStatusClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:_footerBtn];
    }
    return _footerView;
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
