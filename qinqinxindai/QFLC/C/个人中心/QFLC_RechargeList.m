//
//  QFLC_RechargeList.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#define ORDER_CELL              @"OrderCell"


#import "QFLC_RechargeList.h"
#import "OrderCell.h"
#import "OrderListModel.h"

@interface QFLC_RechargeList ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *orderTable;

@property (nonatomic, copy)NSMutableArray *dataArr;

@end

@implementation QFLC_RechargeList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值订单";
    
    self.dataArr = [RRTool getOrderList];
    
    [self.view addSubview:self.orderTable];
   
    

    
}
#pragma mark - delegate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ORDER_CELL];
    if (!cell) {
        cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ORDER_CELL];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = hexColor(f2f2f2);
    }
    OrderListModel *model = self.dataArr[indexPath.row];
    cell.orderModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return APP_HEIGHT_6S(100.0);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListModel *model = self.dataArr[indexPath.row];
    if ([model.status isEqualToString:@"0"]) {//如果状态是支付状态可以点击继续进行支付
        
    }
}


#pragma mark - lazy load
- (UITableView *)orderTable{
     if (!_orderTable) {
        _orderTable = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, KSCREEN_WIDTH, KSCREEN_HEIGHT-SafeAreaTopHeight)];
        _orderTable.delegate = self;
        _orderTable.dataSource = self;
        _orderTable.showsVerticalScrollIndicator = NO;
        _orderTable.showsHorizontalScrollIndicator = NO;
        _orderTable.backgroundColor = [UIColor clearColor];
         _orderTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, APP_HEIGHT_6S(20.0))];
         if (@available(iOS 11.0, *)) {
        _orderTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        }
        _orderTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _orderTable;
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
