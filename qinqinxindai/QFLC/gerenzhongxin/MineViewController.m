//
//  MineViewController.m
//  ZYJSVPN
//
//  Created by mac on 2018/12/20.
//  Copyright © 2018年 ZrteC. All rights reserved.
//

#import "MineViewController.h"
#import "mineOrderCell.h"
#import "userInformationController.h"
#import "rechargeOrderController.h"
#import "MyWebViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_imageArr;
    NSArray *_tittleArr;
}
/**
 用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *endDate; //到期时间
@property (weak, nonatomic) IBOutlet UILabel *dueDay;  //剩余天数
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MineViewController

//将要出现时
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    
    if (![UserInfoManager shareInstance].userInforModel.password && ![CacheInfoManager shareInstance].isAlertPasswordStatus) {
        //密码未设置   提示设置密码
        ZRAlertController *alert = [ZRAlertController initZRAlerControllerWithTitle:@"提示" message:@"当前账号尚未设置密码，为了您的账号安全，请前往个人中心及时设置密码" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"下次再说",@"马上设置",nil] alerAction:^(NSInteger index) {
            [CacheInfoManager shareInstance].isAlertPasswordStatus = YES;
            if (index) {
                userInformationController *userVC = [[userInformationController alloc] init];
                [userVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:userVC animated:YES];
            }
        }];
        [alert showWBAler];
        
    }
    
    self.userName.text = [UserInfoManager shareInstance].userInforModel.nickname;
    self.dueDay.text = [NSString stringWithFormat:@"可使用%@天",[UserInfoManager shareInstance].userInforModel.surplus_day];
    self.endDate.text = [UserInfoManager shareInstance].userInforModel.due_date?[UserInfoManager shareInstance].userInforModel.due_date:@"- -";
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArr = @[@"mine_chargeOrder",@"mine_Agreement",@"mine_explain",@"mine_checkUpdate"];
    _tittleArr = @[@"充值订单",@"服务协议",@"资费说明",@"当前版本"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)tapUserInformation:(id)sender {
    userInformationController *userVC = [[userInformationController alloc] init];
    [userVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:userVC animated:YES];
}
- (IBAction)tapUserInformationIcon:(id)sender {
    userInformationController *userVC = [[userInformationController alloc] init];
    [userVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:userVC animated:YES];
}

- (IBAction)tapLoginOutButtonAction:(id)sender {
    [self loginOutRequset];
}

#pragma mark - delegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    mineOrderCell *cell = [mineOrderCell mineOrderCellWithTableView:tableView];
    [cell configUIWithImageName:_imageArr[indexPath.row] andTittleName:_tittleArr[indexPath.row]];
    if (indexPath.row == 3) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *app_Version  = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        cell.bottomLabel.hidden = YES;
        cell.arrowImageView.hidden = YES;
        cell.detailLabel.text = [NSString stringWithFormat:@"V%@",app_Version];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46.25*AdaptH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        rechargeOrderController *orderVC = [[rechargeOrderController alloc] init];
        [orderVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:orderVC animated:YES];
    }else if (indexPath.row == 1){
        MyWebViewController *webVC = [[MyWebViewController alloc] init];
        webVC.tittleStr = @"服务协议";
        webVC.urlStr = getPurchaseNotice;
        [webVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:webVC animated:YES];
    }else if (indexPath.row == 2){
        MyWebViewController *webVC = [[MyWebViewController alloc] init];
        webVC.tittleStr = @"资费说明";
        webVC.urlStr = getConsumptionNotice;
        [webVC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:webVC animated:YES];
    }
}

#pragma mark - request
- (void)loginOutRequset{
    //退出登录接口
    NSDictionary *dic = @{@"uid":[[UserInfoManager shareInstance] getUid],
                          @"token":[[UserInfoManager shareInstance] getToken]
                          };
    [[HTTPManager shareNetWorkRequest] sendPostRequestUrlStr:logout parameters:dic success:^(NSDictionary * _Nonnull requestDic) {
        if ([[requestDic objectForKey:@"code"] isEqualToString:@"0"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationWillTerminate" object:nil];
            [[UserInfoManager shareInstance] signOut];
            NewLoginViewController *loginVC = [[NewLoginViewController alloc] init];
            BaseNavigationController *NAVC = [[BaseNavigationController alloc] initWithRootViewController:loginVC];
            AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = NAVC;
        }else{
            ZRAlertController *alert = [ZRAlertController initZRAlerControllerWithTitle:@"提示" message:[requestDic objectForKey:@"msg"] style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"确定",nil] alerAction:^(NSInteger index) {

            }];
            [alert showWBAler];
        }
    } failure:^(id  _Nonnull errorInfo) {

    }];
}

#pragma mark - lazy load
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
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
