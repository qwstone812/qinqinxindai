//
//  QFLC_jinbiListVC.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_jinbiListVC.h"
#import "QFLC_JinBiCell.h"
@interface QFLC_jinbiListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *listTableView;
@property (nonatomic,strong)UIView *headerView;
@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)UILabel *yueLabel;
@property (nonatomic,strong)UILabel *yzqLabel;
@property (nonatomic,assign)NSInteger type;
@property (nonatomic,strong)NSArray *record;
@property (nonatomic,strong)NSArray *yzqrecord;

@property (nonatomic,assign)BOOL isLoad;
@end

@implementation QFLC_jinbiListVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _isLoad = NO;
    _type = 0;
    self.title = @"亲亲币记录";
    [self creatTableView];
//    [self.view addSubview:navView];
    // Do any additional setup after loading the view.
}
- (void)creatTableView{
    _listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight  , KWIDTH, KHEIGHT-NaviHeight) style:UITableViewStyleGrouped];
    _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    _listTableView.estimatedRowHeight = 100;
    _listTableView.rowHeight = UITableViewAutomaticDimension;
    [_listTableView registerNib:[UINib nibWithNibName:@"QFLC_JinBiCell" bundle:nil] forCellReuseIdentifier:@"QFLC_JinBiCell"];
//    _listTableView.tableHeaderView = self.headerView;
    [self.view addSubview:_listTableView];
    _listTableView.backgroundColor = hexColor(F8F8F8);
//    self.listTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
////        self.currentPage = 1;
//        [self loadListData];
//    }];
}

- (void)backClick{
    __pop();
}
#pragma mark - 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [QQXDManager shareInstance].weibiRecords.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * arr = [QQXDManager shareInstance].weibiRecords;
  
    NSDictionary * dic = arr[indexPath.row];
    QFLC_JinBiCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_JinBiCell"];
    cell.nameL.text = [dic[@"reason"] description];
    cell.goldL.text = [NSString stringWithFormat:@"%@%@",dic[@"type"],dic[@"money"]];
    cell.dateL.text = [dic[@"date"] description];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [_selectedArray replaceObjectAtIndex:_selectIndex withObject:[NSNumber numberWithInteger:indexPath.row]];
//    [tableView reloadData];
    //    MSHomeForYouModel *model = _listDataArr[indexPath.section];
    //    MSProductDetailVC *target = [[MSProductDetailVC alloc]init];
    //    target.ID = model.ID;
    //    [self.navigationController pushViewController:target animated:YES];
}
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 85 + 26)];
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(13,13,KWIDTH - 26,85);
        view.backgroundColor = [UIColor colorWithRed:254/255.0 green:250/255.0 blue:240/255.0 alpha:1.0];
        view.layer.shadowColor = [UIColor colorWithRed:216/255.0 green:179/255.0 blue:87/255.0 alpha:0.25].CGColor;
        view.layer.shadowOffset = CGSizeMake(0,0);
        view.layer.shadowOpacity = 1;
        view.layer.shadowRadius = 7;
        view.layer.cornerRadius = 10;
        CGFloat itemWidth = (KWIDTH - 26)/2;
        UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (KWIDTH - 26)/2, 85)];
        UILabel *label1 = [[UILabel alloc] init];
        label1.frame = CGRectMake(0,23,itemWidth,15);
        label1.font = appMFont(16);
        label1.textColor = hexColor(C0A466);
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = [QQXDManager shareInstance].currentWeiBi;
        [view1 addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.frame = CGRectMake(0,label1.bottom + 8,itemWidth,13);
        label2.font = appFont(14);
        label2.textColor = hexColor(C0A466);
        label2.textAlignment = NSTextAlignmentCenter;
        label2.text = @"亲亲币余额";
        [view1 addSubview:label2];
        [view addSubview:view1];
        

        
        UIView * view3 = [[UIView alloc]initWithFrame:CGRectMake(itemWidth * 1, 0, (KWIDTH - 26)/3, 85)];
        UILabel *label5 = [[UILabel alloc] init];
        label5.frame = CGRectMake(0,23,itemWidth,15);
        label5.font = appMFont(16);
        label5.textColor = hexColor(C0A466);
        label5.textAlignment = NSTextAlignmentCenter;
        label5.text = @"交易记录";
        [view3 addSubview:label5];
        
        UILabel *label6 = [[UILabel alloc] init];
        label6.frame = CGRectMake(0,label1.bottom + 8,itemWidth,13);
        label6.font = appFont(14);
        label6.textColor = hexColor(C0A466);
        label6.textAlignment = NSTextAlignmentCenter;
        label6.text = @"充值/消费/奖励";
        [view3 addSubview:label6];
        [view addSubview:view3];
        _yueLabel = label1;

        [_headerView addSubview:view];
    }
    return _headerView;
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
