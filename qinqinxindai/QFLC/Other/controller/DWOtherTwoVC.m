//
//  DWOtherTwoVC.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherTwoVC.h"
#import "DWOtherTwoCell.h"

@interface DWOtherTwoVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray* listDataArray;

@end

@implementation DWOtherTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    if(![[[kDefaults objectForKey:@"fromType"]description]isEqualToString:@"B"]){
//        return;
//    }
    self.navigationItem.leftBarButtonItem = nil;

    self.title = @"全部";
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
        [self loadAllMouldData];
    }];
    [self.djttableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
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
#pragma mark - 数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0.01;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DWOtherTwoCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DWOtherTwoCell"];
    if (!cell) {
        cell = [[DWOtherTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DWOtherTwoCell"];
    }
    DWOtherModel * model = self.listDataArray[indexPath.section];
        [cell setModel:model];
//    [cell.logoImgV sd_setImageWithURL:[NSURL URLWithString:model.p_logo]];
//    cell.nameLab.text = model.p_name;
//    cell.subLab.text = model.p_desc;
//    cell.ammontLab.text = [NSString stringWithFormat:@"%@~%@",model.minimum_amount,model.maximum_amount];
//
//    cell.dayLab.text = [NSString stringWithFormat:@"周期：%@~%@天",model.min_cycle,model.max_cycle];
//
//    cell.rateLab.text = [NSString stringWithFormat:@"利率：%@%%/日",model.min_algorithm];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 145;
}

#pragma mark - 代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [Utilities dealWithModel:_listDataArray[indexPath.section] controller:self];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
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
