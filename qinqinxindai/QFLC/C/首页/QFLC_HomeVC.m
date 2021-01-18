//
//  QFLC_HomeVC.m
//  DiShuiManager
//
//  Created by zrmac on 28.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_HomeVC.h"
#import "QFLC_HomeTopCell.h"
#import "QFLCNetManager.h"

#import "QFLC_ForumDetail.h"
#import "QFLC_ForumCell.h"
#import "QFLC_VIPVC.h"
#import "QFLC_ClientListVC.h"
@interface QFLC_HomeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *iconArray;


@property(nonatomic,strong)NSArray *orders;


@property(nonatomic,strong)UIView *coverView;
@property (nonatomic,strong)UIView *netWorkView;


@end

@implementation QFLC_HomeVC

#pragma mark   --net
- (UIView *)netWorkView{
    if (!_netWorkView) {
        _netWorkView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT)];
                _netWorkView.backgroundColor = UIWhiteColor;
                UIImageView *logoImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, (KHEIGHT - 180)/2, KWIDTH, 150)];
        //        logoImgV.backgroundColor =UIRedColor;
                [_netWorkView addSubview:logoImgV];
                logoImgV.contentMode = UIViewContentModeScaleAspectFit;
                logoImgV.image = [UIImage imageNamed:@"neterror"];
                UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, logoImgV.bottom+10, KWIDTH, 20)];
                titleLab.centerY = KHEIGHT / 2;
                logoImgV.bottom = titleLab.top - 20  ;
                [_netWorkView addSubview:titleLab];
                titleLab.text = @"网络不给力，点击屏幕重新加载";
                titleLab.textColor = hexColor(999999);
                titleLab.textAlignment = NSTextAlignmentCenter;
                titleLab.font = appFont(15);
                
                UIButton *refreshBtn = [[UIButton alloc]initWithFrame:CGRectMake((KWIDTH - 110)/2, titleLab.bottom+20, 110, 35)];
                        [refreshBtn setTitle:@"点击重试" forState:UIControlStateNormal];
                        [refreshBtn setTitleColor:UIWhiteColor forState:UIControlStateNormal];
                        refreshBtn.titleLabel.font = appFont(16);
                ViewForBorderRadius(refreshBtn, refreshBtn.height/2, 0.5, hexColor(cccccc));
                refreshBtn.backgroundColor = hexColor(5589F7);
                        [refreshBtn addTarget:self action:@selector(reloadCustomers) forControlEvents:UIControlEventTouchUpInside];
                [_netWorkView addSubview:refreshBtn];
                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((KWIDTH - 280)/2, refreshBtn.bottom+10, 280, 40)];
                [btn setTitle:@"未打开网络权限，去开启>" forState:UIControlStateNormal];
                [btn setTitleColor:hexColor(999999) forState:UIControlStateNormal];
                btn.titleLabel.font = appFont(13);
        //        ViewForBorderRadius(btn, 5, 0.5, hexColor(cccccc));
                [btn addTarget:self action:@selector(gotoSetting) forControlEvents:UIControlEventTouchUpInside];
                [_netWorkView addSubview:btn];
                [_netWorkView addTarget:self action:@selector(reloadCustomers)];
    }
    return _netWorkView;
}
-(UIView *)coverView{
    if(!_coverView){
        _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT)];
        _coverView.backgroundColor = UIWhiteColor;
        UIImageView * guideImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"qqxdlaun"]];
        guideImg.frame = CGRectMake(0, 0, KWIDTH, KHEIGHT);
        guideImg.contentMode = UIViewContentModeScaleAspectFit;
        [_coverView addSubview:guideImg];
    }
    return _coverView;
}
-(void)gotoSetting{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

-(void)reloadCustomers{
    
    [QFLCNetManager qflcgetRequsetWithUrl:@"http://lm.xinhelw.com/customers?market=ios&name=%E4%BF%A1%E9%92%B1%E5%8C%85iOS" Paramater:@{} SuccessBlock:^(id responseObject) {
        if (responseObject[@"data"]) {
            [kDefaults setObject:responseObject[@"data"] forKey:@"Customers"];
            [kDefaults synchronize];
            [self reloadTableView];
        }
        [self.coverView removeFromSuperview];
        [self.netWorkView removeFromSuperview];
        
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } FailBlock:^(NSError *error) {
        [[Utilities appDelegate].window addSubview:self.netWorkView];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"信贷员培训心得篇1",@"月薪上万的信贷经理，和你有什么不同",@"学会这5条，想干不好贷款都难！"];
    self.iconArray = @[@"xinde1",@"xinde4",@"xinde6"];
    self.navigationItem.title = @"亲亲信贷";
    self.navigationItem.leftBarButtonItem = nil;
    [self initqflcUI];
    
    [self reloadCustomers];

    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self refreshData];
}

-(void)initqflcUI{
    UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, NaviHeight)];
    navView.backgroundColor = ThemeColor;
    UIImageView * logoImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    logoImgV.frame = CGRectMake(10, StatusBarHeight , KWIDTH - 20 , (KWIDTH-20) / 980 * 90);
    [navView addSubview:logoImgV];
    [self.view addSubview:navView];
    logoImgV.contentMode = UIViewContentModeScaleAspectFit;
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, KWIDTH, KHEIGHT - TabbarHeight - NaviHeight) style:1];
        self.djttableView.delegate = self;
        self.djttableView.dataSource = self;
        [self.view addSubview:self.djttableView];
        if(@available(iOS 11.0,*)){
            self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.djttableView registerNib:[UINib nibWithNibName:@"QFLC_HomeTopCell" bundle:nil] forCellReuseIdentifier:@"QFLC_HomeTopCell"];
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 0)];
    UIImageView * bannerImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"17371603781767_.pic_hd"]];
    bannerImgV.frame = CGRectMake(15, 10, KWIDTH - 30, (KWIDTH - 30)/750.0 * 300.0);
    headerView.height = bannerImgV.bottom;
    ViewForBorderRadius(bannerImgV, 8, 0, UIClearColor);
    [headerView addSubview:bannerImgV];
//    self.djttableView.tableHeaderView = headerView;
    self.djttableView.backgroundColor = hexColor(f2f2f2);
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 70)];
    UIImageView * footerImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"17291603780011_.pic"]];
    footerImgV.frame = CGRectMake(15, 10, KWIDTH - 30, (KWIDTH - 30) / 714.0 * 124.0 );
    [footerView addSubview:footerImgV];
    if([[QQXDManager shareInstance].currentWeiBi floatValue]<=0){
        [[QQXDManager shareInstance]increaseWeiBiWithAmount:35 reason:@"身份认证"];
    }
    [[Utilities appDelegate].window addSubview:self.coverView];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1){
        
        return 3;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
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


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return APP_HEIGHT_6S(230.0);
    }
    return 368;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        QFLC_HomeTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_HomeTopCell"];
        cell.clickAction = ^(NSInteger tag){
            
            
            
            
            switch (tag) {
                case 0:
                {
                    __pushWithClassName(@"QFLC_VIPVC");
                }
                    break;
                case 1:
                {
                    if (![Utilities checkIsLogin]) {
                        [Utilities gotoQFLCLoginWith:self];
                        return;
                    }
                    __pushWithClassName(@"QFLC_RenZhengVC");

                }
                    break;
                case 2:
                {
                    if (![Utilities checkIsLogin]) {
                        [Utilities gotoQFLCLoginWith:self];
                        return;
                    }
                    __pushWithClassName(@"QFLC_MyOrderVC");
                }
                    break;
                case 3:
                {
                    if (![Utilities checkIsLogin]) {
                        [Utilities gotoQFLCLoginWith:self];
                        return;
                    }
                    [self.tabBarController setSelectedIndex:1];

                }
                    break;
                    
                case 4:
                {
                    __pushWithClassName(@"QFLC_GYWMVC");
                }
                    break;
                default:
                    break;
            }
        };
        return cell;
        
    }
    
    
    else if(indexPath.section == 1){
        QFLC_ForumCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ForumCell"];
        if (!cell) {
            cell = [[QFLC_ForumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_ForumCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }

        cell.titleLabel.text = self.titleArray[indexPath.row];
        cell.matchIcon.image = Img(self.iconArray[indexPath.row]);
        return cell;
        
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        QFLC_ForumDetail * target = [[QFLC_ForumDetail alloc]init];
        target.hidesBottomBarWhenPushed = YES;
        target.qflc_title = self.titleArray[indexPath.row];
        NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:self.iconArray[indexPath.row] ofType:@"html"]];
        target.content  =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        __push(target);
    }

}





- (void)refreshData{
    _orders = [QQXDManager shareInstance].orders;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.djttableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
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
