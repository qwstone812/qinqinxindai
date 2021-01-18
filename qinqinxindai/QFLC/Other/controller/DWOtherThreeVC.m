//
//  DWOtherThreeVC.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherThreeVC.h"
#import "QFLC_MineTopCell.h"
#import "DWOtherTwoCell.h"
@interface DWOtherThreeVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray* listDataArray;

@end

@implementation DWOtherThreeVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    if(![[[kDefaults objectForKey:@"fromType"]description]isEqualToString:@"B"]){
//        return;
//    }
    [self.view addSubview:self.djttableView];
    self.djttableView.frame = CGRectMake(0, 0, KWIDTH, KHEIGHT - TabbarHeight );
 
    self.djttableView.delegate = self;
    self.djttableView.dataSource = self;
    self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.djttableView.backgroundColor = [UIColor clearColor];
    self.djttableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadAllMouldData];
    }];
    [self.djttableView.mj_header beginRefreshing];
    [self.djttableView registerNib:[UINib nibWithNibName:@"QFLC_MineTopCell" bundle:nil] forCellReuseIdentifier:@"QFLC_MineTopCell"];
    UIView * footyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 100)];
       UIButton * tuichuButton = [UIButton buttonWithType:UIButtonTypeCustom];
       tuichuButton.frame = CGRectMake(20,15, KScreenWidth-40,44);
       [tuichuButton setTitleColor:UIWhiteColor forState:UIControlStateNormal];
       [tuichuButton setTitle:@"退出登录" forState:UIControlStateNormal];
       [tuichuButton addTarget:self action:@selector(tuiChuction) forControlEvents:UIControlEventTouchUpInside];

       tuichuButton.backgroundColor =ThemeColor;
       ViewForBorderRadius(tuichuButton, 22, 0, UIClearColor);
       [footyView addSubview:tuichuButton];
       
       self.djttableView.tableFooterView = footyView;
    // Do any additional setup after loading the view.
}
#pragma mark - 退出登录按钮点击事件
-(void)tuiChuction
{
    
  
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [kDefaults setObject:@"B" forKey:@"fromType"];

    if ([Utilities checkIsLogin] == NO)
    {
        [Utilities gotoLogin2With:self];
        return;
    }
    [self.djttableView reloadData];

    
}
#pragma mark - 接口加载
-(void)loadAllMouldData{
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    return _listDataArray.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 145;
    }
    return 167;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        QFLC_MineTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_MineTopCell"];
        if ([Utilities checkIsLogin]) {
            NSString * phone =  [kDefaults objectForKey:DaichaoUserInfoKey][@"userphone"];
            if (phone.length > 4) {
                phone  = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
            }
            
            NSLog(@"%@",[kDefaults objectForKey:DaichaoUserInfoKey]);
            cell.nameL.text = phone;
        }else{
            cell.nameL.text = @"立即登录>";
        }
        return cell;
    }
    DWOtherTwoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DWOtherTwoCell"];
    if (!cell) {
        cell = [[DWOtherTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DWOtherTwoCell"];
    }
    DWOtherModel * model = _listDataArray[indexPath.row];
    [cell setModel:model];
    
    return cell;
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        [Utilities dealWithModel:_listDataArray[indexPath.row] controller:self];
    }
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
