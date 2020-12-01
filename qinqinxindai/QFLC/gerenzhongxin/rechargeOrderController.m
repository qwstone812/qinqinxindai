//
//  rechargeOrderController.m
//  ZYJSVPN
//
//  Created by mac on 2018/12/26.
//  Copyright © 2018年 ZrteC. All rights reserved.
//

#import "rechargeOrderController.h"
#import "rechargeOrderCell.h"
#import "OrderListModel.h"

@interface rechargeOrderController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSMutableArray *dataArr;

@end

@implementation rechargeOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值订单";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UINib *nib = [UINib nibWithNibName:@"rechargeOrderCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"rechargeOrderCell"];
    
    [self requestOrderList];
}
#pragma mark - delegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    rechargeOrderCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"rechargeOrderCell" forIndexPath:indexPath];
    OrderListModel *model = self.dataArr[indexPath.row];
    [cell configUIWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListModel *model = self.dataArr[indexPath.row];
    if ([model.status isEqualToString:@"0"]) {//如果状态是支付状态可以点击继续进行支付
        
    }
}

#pragma mark - request
- (void)requestOrderList{
    NSDictionary *dic = @{@"uid":[[UserInfoManager shareInstance] getUid],
                          @"token":[[UserInfoManager shareInstance] getToken]
                          };
    [[HTTPManager shareNetWorkRequest] sendPostRequestUrlStr:getOrderList parameters:dic success:^(NSDictionary * _Nonnull requestDic) {
        if ([[requestDic objectForKey:@"code"] isEqualToString:@"0"]) {
            NSArray *temArr = [OrderListModel mj_objectArrayWithKeyValuesArray:[requestDic objectForKey:@"data"]];
            
            if (temArr.count > 0) {
                [self.dataArr addObjectsFromArray:temArr];
                [self.tableView reloadData];
            }else{
//                [MTool showText:@"暂无订单"];
            }
            
        }
    } failure:^(id  _Nonnull errorInfo) {
        
    }];
}

#pragma mark - lazy load
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
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
