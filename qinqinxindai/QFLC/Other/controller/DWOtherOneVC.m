//
//  DWOtherOneVC.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherOneVC.h"
#import "DWOtherOneFirstCell.h"
#import "DWOtherOneThirdCell.h"
#import "DWOtherOneSecondCell.h"
#import "DWOtherTwoCell.h"
#import "QFLC_Login2VC.h"
@interface DWOtherOneVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIView * navView;
@property (nonatomic,strong)UILabel * titleL;
@property (nonatomic,strong)UIImageView * logoImageView;
@property (nonatomic,strong)UIButton * fenleiBtn;
@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UILabel *appNameLab;
@property(nonatomic,strong)NSMutableArray* listDataArray;
@property (nonatomic,assign)NSInteger djCount;
@property (nonatomic,strong)NSMutableArray *zcggArr;
@end

@implementation DWOtherOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT)];
    view.backgroundColor = UIWhiteColor;
    [[Utilities appDelegate].window addSubview:view];
    if(![Utilities checkIsLogin]){
        QFLC_Login2VC * login = [[QFLC_Login2VC alloc]init];
        UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:login];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;

        [self presentViewController:nav animated:NO completion:^{
            [view removeFromSuperview];
        }];
        
    }
    
    // Do any additional setup after loading the view.
    [Utilities delay:0.2 view:self.view action:^{
        [view removeFromSuperview];
    }];
    _djCount = 0;
    UIImageView * topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 143)];
    topImageView.image = [UIImage imageNamed:@"头部"];
    [self.view addSubview:topImageView];
    [self.view addSubview:self.navView];

    self.navigationItem.leftBarButtonItem = nil;
    self.navigationController.navigationBar.barTintColor = UIWhiteColor;
    [self.view addSubview:self.djttableView];
    self.djttableView.frame = CGRectMake(0, NaviHeight, KWIDTH, KHEIGHT - TabbarHeight - NaviHeight);
        if(@available(iOS 11.0,*)){
             self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.djttableView.backgroundColor = [UIColor clearColor];
    self.djttableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadJieTiaoData];
    }];
//    [self.djttableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}
-(void)loadJieTiaoData{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    NSDictionary *param1 = @{ @"token": DaichaoToken,
                              @"order_type": @"1",
                              @"max_money": @"",
                              @"min_money": @"",
                              @"max_date": @"",
                              @"min_date": @"" };
    
    
    [QFLCNetManager qflcPostRequsetWithUrl:DCLoanList_Url Paramater:param1 SuccessBlock:^(id responseObject) {
        NSInteger error_code = [responseObject[@"error_code"] integerValue];
        if (error_code == 0) {
            self.listDataArray = [DWOtherModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.djttableView reloadData];
            });
        }else{
            NSString* msg = responseObject[@"error_message"];
            [self.view makeToast:msg];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.djttableView.mj_header endRefreshing];
    } FailBlock:^(NSError *error) {
        NSLog(@"%@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:@"网络错误，请稍候重试"];
        [self.djttableView.mj_header endRefreshing];
    }];
    
   
}
- (void)loadUserInfo{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [QFLCNetManager qflcPostRequsetWithUrl:ScreeningProductUrl Paramater:@{@"name":APPNAME,@"offset":@0} SuccessBlock:^(id responseObject) {
        NSInteger error_code = [responseObject[@"error_code"] integerValue];

        if (error_code == 0) {
            self.zcggArr = [DWOtherModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
          
            [self.djttableView reloadData];

        }else{
            NSString* msg = responseObject[@"error_message"];
            [self.view makeToast:msg];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.djttableView.mj_header endRefreshing];
    } FailBlock:^(NSError *error) {
        NSLog(@"%@",error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view makeToast:@"网络错误，请稍候重试"];
        [self.djttableView.mj_header endRefreshing];
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = YES;
    [self loadJieTiaoData];
}
-(UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, NaviHeight)];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake((KWIDTH - 100)/2, StatusBarHeight, 100, 44)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = UIWhiteColor;
        lab.font = appFont(20);
        lab.text = @"亲亲信贷";
        [self.navView addSubview:lab];
        _appNameLab = lab;
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.width = 25;
        btn.height = 25;
        btn.right = KWIDTH - 15;
        btn.centerY = lab.centerY;
        [btn setImage:[UIImage imageNamed:@"图层27"] forState:UIControlStateNormal];
        _fenleiBtn = btn;
        [_navView addSubview:btn];
        [btn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];

    }
    return _navView;
}
#pragma mark - 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 3){
        return _listDataArray.count;
    }
    return 1;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    return [UIView new];
   
}

- (void)moreClick{
    self.tabBarController.selectedIndex = 1;
    
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return   195;
    }else if (indexPath.section == 1){
        return 70;
    }else if (indexPath.section == 2){
        return 40;
    }else if (indexPath.section == 3){
       return 145;
    }
    return 90;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        DWOtherOneFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDBan"];
        if (!cell) {
            cell = [[DWOtherOneFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIDBan"];
        }
        cell.backgroundColor = UIClearColor;
        return cell;
    }else if (indexPath.section == 1){
        DWOtherOneThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDZeroC"];
        if (!cell) {
            cell = [[DWOtherOneThirdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIDZeroC"];
        }
        
        return cell;
    }else if (indexPath.section == 2){
        DWOtherOneSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIDOneC"];
        if (!cell) {
            cell = [[DWOtherOneSecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIDOneC"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == 3){
          DWOtherTwoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DWOtherTwoCell"];
        if (!cell) {
                   cell = [[DWOtherTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DWOtherTwoCell"];
               }
            DWOtherModel * model = _listDataArray[indexPath.row];
        [cell setModel:model];

            
            return cell;
    }

    return nil;
    
}

#pragma mark - 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 || indexPath.section == 1) {
        if (![Utilities checkIsLogin]) {
            [Utilities gotoLogin2With:self];
            return;
        }
        _djCount++;
        DWOtherModel * model = _listDataArray[_djCount%_listDataArray.count];
        if(model){
           [Utilities dealWithModel:model controller:self];;
        }
    }else if(indexPath.section == 3){
        [Utilities dealWithModel:_listDataArray[indexPath.row] controller:self];;
    }else if(indexPath.section == 2){
        [self moreClick];
    }
//    if (indexPath.section == 1) {
//        if (_zcggArr.count > 0) {
//            DWOtherModel * model = _zcggArr[ _vMarquee.currentIndex];
//            [QFLCNetManager qflcPostRequsetWithUrl:ApplyUrl Paramater:@{@"token":DaichaoToken,@"name":APPNAME,@"id":model.ID} SuccessBlock:^(id responseObject) {
//
//            } FailBlock:^(NSError *error) {
//
//            }];
//            H5ViewController* webVC = [[H5ViewController alloc]init];
//            webVC.WebURLStr = model.url;
//            webVC.titleProductStr = model.p_name;
//            [self.navigationController pushViewController:webVC animated:YES];
//        }
//    }
    //    if (indexPath.section == 0 || indexPath.section ==1 || indexPath.section == 2) {
    //        return;
    //    }
//    if (indexPath.section == 2) {
//        if (!DaichaoToken) {
//            NewLoginVC * loginVC = [[NewLoginVC alloc]init];
//            [self.navigationController pushViewController:loginVC animated:YES];
//            return;
//        }
//        if(_zcggArr.count > 0){
//            //            DWOtherModel * model = _zcggArr[0];
//            NSDictionary * dic = _zcggArr[0];
//            [QFLCNetManager qflcPostRequsetWithUrl:ApplyUrl Paramater:@{@"token":DaichaoToken,@"name":APPNAME,@"id":dic[@"id"]} SuccessBlock:^(id responseObject) {
//
//            } FailBlock:^(NSError *error) {
//
//            }];
//            H5ViewController* webVC = [[H5ViewController alloc]init];
//            webVC.WebURLStr = dic[@"url"];
//            webVC.titleProductStr =dic[@"p_name"];
//            [self.navigationController pushViewController:webVC animated:YES];
//        }
//
//    }
//    if (indexPath.section == 3) {
//        if (!DaichaoToken) {
//            NewLoginVC * loginVC = [[NewLoginVC alloc]init];
//            [self.navigationController pushViewController:loginVC animated:YES];
//            return;
//        }
//        DWOtherModel * model = _listDataArray[indexPath.row];
//        [QFLCNetManager qflcPostRequsetWithUrl:ApplyUrl Paramater:@{@"token":DaichaoToken,@"name":APPNAME,@"id":model.ID} SuccessBlock:^(id responseObject) {
//
//        } FailBlock:^(NSError *error) {
//
//        }];
//        H5ViewController* webVC = [[H5ViewController alloc]init];
//        webVC.WebURLStr = model.url;
//        webVC.titleProductStr = model.p_name;
//        [self.navigationController pushViewController:webVC animated:YES];
//    }
    
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
