//
//  QFLC_MyOrderVC.m
//  qinqinxindai
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_MyOrderVC.h"

#import "QFLC_ClientCell.h"
#import "QFLC_ClientDetailVC.h"

#import "ZRSegmentedControl.h"

@interface QFLC_MyOrderVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray * orders;

@property (nonatomic,strong)NSMutableArray * labels;

@property (nonatomic,strong)NSArray * titles;
@property (nonatomic,strong)UIView * redLine;

@property (nonatomic,assign)NSInteger topIndex;
@property (nonatomic,assign)NSInteger secodeIndex;

@property (nonatomic, strong) ZRSegmentedControl           *segmentControl;


@end

@implementation QFLC_MyOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = nil;

    _topIndex = 0;
    
    _secodeIndex = 0;
    self.title = @"我的订单";
    [self.view addSubview:self.segmentControl];

    
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentControl.bottom, KWIDTH, KHEIGHT  - self.segmentControl.bottom) style:1];
        self.djttableView.delegate = self;
        self.djttableView.dataSource = self;
        [self.view addSubview:self.djttableView];
        if(@available(iOS 11.0,*)){
            self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
        self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self refreshData];

}
-(void)refreshData{
    _orders = [NSMutableArray array];
    [Utilities delay:0.1 view:self.view action:^{
        for (DSMOrder * order in [QQXDManager shareInstance].orders) {
            if(![order.status isEqualToString:@"0"]){
                if (_secodeIndex == 0 || (_secodeIndex == 1&& [order.status isEqualToString:@"1"]) || (_secodeIndex == 2&& [order.status isEqualToString:@"2"]) || (_secodeIndex == 3&& [order.status isEqualToString:@"3"])) {
                    [_orders addObject:order];
                }
            }
            
        }
        [self.djttableView reloadData];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _orders.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 20;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return APP_HEIGHT_6S(175.0);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//  QFLC_ClientCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ClientCell"];
    
    QFLC_ClientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ClientCell123"];

    if (!cell) {
        cell = [[QFLC_ClientCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_ClientCell123"];
        cell.backgroundColor = hexColor(f2f2f2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    DSMOrder * order = _orders[indexPath.section];

    
    cell.moneyLabel.text = order.money;
    cell.explianLabel.text = order.labels;
    cell.itemBtn.ydTitle = order.discount;
    
   if (order.discount.length > 0) {
       cell.nameLabel.text = [NSString stringWithFormat:@"%@（%@）",order.name,order.discount] ;
   }else{
       cell.nameLabel.text = order.name;
   }
   if ([order.status isEqualToString:@"0"]) {
       cell.itemBtn.ydTitle = [NSString stringWithFormat:@"%@亲亲币",order.cost];
       cell.itemBtn.bgColor = hexColor(FF403F);
   }else if ([order.status isEqualToString:@"1"]) {
         cell.itemBtn.ydTitle = @"未联系";
         cell.itemBtn.bgColor = hexColor(a8a8a8);
     }else if([order.status isEqualToString:@"2"]){
         cell.itemBtn.ydTitle = @"跟进中";
         cell.itemBtn.bgColor = ThemeColor;
     }
     else{
         cell.itemBtn.ydTitle = @"无效订单";
         cell.itemBtn.bgColor = hexColor(eeeeee);
     }
//   cell.dsm_labelsL.text = order.labels;
//   return cell;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QFLC_ClientDetailVC * target = [[QFLC_ClientDetailVC alloc]init];
    target.order = _orders[indexPath.section];
             target.hidesBottomBarWhenPushed = YES;
             __push(target);
//    MyCustomer * cus = _customers[indexPath.row];
//    XDB_KUHUXIANGQINGVC * target = [[XDB_KUHUXIANGQINGVC alloc]init];
//    target.customer = cus;
//    __push(target);
}


#pragma mark --lazy

- (ZRSegmentedControl *)segmentControl{
    @WeakObj(self);
    if (!_segmentControl) {
        _segmentControl = [[ZRSegmentedControl alloc] initWithFrame:CGRectMake(15, NaviHeight + 15, KWIDTH-30, 30) titleArray:@[@"全部",@"未联系",@"跟进订单",@"无效订单"]];
        _segmentControl.segmentClickBlock = ^(NSInteger index) {
                   
            selfWeak.secodeIndex = index;
            [selfWeak refreshData];
        };
    }
    return _segmentControl;
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
