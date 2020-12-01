//
//  QFLC_ClientListVC.m
//  DiShuiManager
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientListVC.h"

#import "QFLC_ClientCell.h"
#import "QFLC_ClientDetailVC.h"

#import "ZRSegmentedControl.h"

@interface QFLC_ClientListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray * orders;

@property (nonatomic,strong)NSMutableArray * labels;

@property (nonatomic,strong)NSArray * titles;
@property (nonatomic,strong)UIView * redLine;

@property (nonatomic,assign)NSInteger topIndex;
@property (nonatomic,assign)NSInteger secodeIndex;



@property (nonatomic, strong) ZRSegmentedControl           *segmentControl;

@end

@implementation QFLC_ClientListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;

    _topIndex = 0;
    
    _secodeIndex = 0;
    self.title = @"抢单大厅";
    [self.view addSubview:self.segmentControl];

    
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.segmentControl.bottom, KWIDTH, KHEIGHT  - self.segmentControl.bottom - TabbarHeight) style:1];
        self.djttableView.delegate = self;
        self.djttableView.dataSource = self;
        [self.view addSubview:self.djttableView];
        if(@available(iOS 11.0,*)){
            self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
    self.djttableView.backgroundColor = hexColor(f2f2f2);
        self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)topClick:(UITapGestureRecognizer *)sender{
    _secodeIndex = sender.view.tag;
    [UIView animateWithDuration:0.2 animations:^{
        UILabel * label = self.labels[sender.view.tag];
        self.redLine.centerX = label.centerX;
    }];
    [self refreshData];
}
- (void)selectedSegmentCClick:(UISegmentedControl *)sender{
    _topIndex =  sender.selectedSegmentIndex;
    [self refreshData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self refreshData];
}
-(void)refreshData{
    _orders = [NSMutableArray array];
    [Utilities delay:0.1 view:self.view action:^{
        for (DSMOrder * order in [QQXDManager shareInstance].orders) {
            if (_secodeIndex == 0 || (_secodeIndex == 1&&order.discount.length > 0)) {
                [_orders addObject:order];
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
    
    QFLC_ClientCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ClientCell"];

    if (!cell) {
        cell = [[QFLC_ClientCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_ClientCell"];
        cell.backgroundColor = hexColor(f2f2f2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    
    DSMOrder * order = _orders[indexPath.section];

    cell.termLabel.text = [NSString stringWithFormat:@"%@个月（周期）",order.term];
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
         cell.itemBtn.bgColor = hexColor(8a8a8a);
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
    DSMOrder * order = _orders[indexPath.section];
    if (![order.status isEqualToString:@"0"]) {
         QFLC_ClientDetailVC * target = [[QFLC_ClientDetailVC alloc]init];
        target.order = order;
           target.hidesBottomBarWhenPushed = YES;
           __push(target);
    }else{
//        if([[DSM_Manager shareInstance] checkWeiBiIsEnoughWithCost:[order.cost floatValue]]){
            [Utilities alertWithTitle:@"温馨提示" message:@"抢单后可查看详情，您是钻石会员，可免费抢此单，是否消耗免费抢单次数？" ConfirmTitle:@"确认抢单" cancelTitle:@"取消" controller:self Confirm:^{
                [Utilities delay:0.3 view:self.view action:^{
                    order.status = @"1";
                    [[Utilities appDelegate]saveContext];
                    [self refreshData];
                    [Utilities alertWithTitle:@"温馨提示" message:@"抢单成功！" ConfirmTitle:@"查看详情" cancelTitle:nil controller:self Confirm:^{
                        QFLC_ClientDetailVC * target = [[QFLC_ClientDetailVC alloc]init];
                        target.order = order;
                           target.hidesBottomBarWhenPushed = YES;
                           __push(target);
                    } cancelAction:^{
                        
                    }];
                }];
            } cancelAction:^{
                
            }];
        }
//    }
   
}


#pragma mark --lazy

- (ZRSegmentedControl *)segmentControl{
    @WeakObj(self);
    if (!_segmentControl) {
        _segmentControl = [[ZRSegmentedControl alloc] initWithFrame:CGRectMake(15, NaviHeight + 15, KWIDTH-30, 30) titleArray:@[@"全部订单",@"会员订单"]];
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
