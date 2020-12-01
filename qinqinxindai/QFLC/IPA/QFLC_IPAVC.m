//
//  QFLC_IPAVC.m
//  DiShuiManager
//
//  Created by zrmac on 28.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#define RECHARGE_CELL        @"RechargeCell"

#import "STRIAPManager.h"
#import "RechargeBottomView.h"

#import "QFLC_IPAVC.h"
#import "QFLC_RechargeCell.h"
#import "CardsModel.h"

@interface QFLC_IPAVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView                  *customTableView;
@property (nonatomic, strong) NSMutableArray               *dataArr;
@property (nonatomic, assign)NSInteger reTag;

@property (nonatomic, copy)NSString *oid;


@property (nonatomic, strong)STRIAPManager *IAPManager;

@property (nonatomic, strong) RechargeBottomView           *bottomView;
@property (nonatomic, strong) UIView                         *footerView;

@property (nonatomic,assign)NSInteger selectIndex;
@property (nonatomic,strong)NSArray *listArr;

@end

@implementation QFLC_IPAVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.selectIndex = 0;
    _listArr = @[@{@"product_id":@"com.zalh.zunyujiasu16",@"payAmount":@"60",@"recieveAmount":@"60"}];
    
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.customTableView];
    self.title = @"充值";
}
- (void)buyButtonAction {
    if (self.reTag<0 ||self.reTag>6) {
        

        return;
    }
}

- (void)payBtnActionWithCardModel:(CardsModel *)cardModel{
    if (!_IAPManager) {
        _IAPManager = [STRIAPManager shareSIAPManager];
    }
    
    // iTunesConnect 苹果后台配置的产品ID
    [_IAPManager startPurchWithID:cardModel.card_type completeHandle:^(SIAPPurchType type,NSData *data) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //请求事务回调类型，返回的数据
        if (type == SIAPPurchVerSuccess) {
            [self.view makeToast:@"校验成功"];
        }else if (type == SIAPPurchSuccess) {
            [self.view makeToast:@"购买成功"];
            //保存充值订单
            OrderListModel *listModel = [OrderListModel new];
            listModel.card_id = @"202012010341";
            listModel.create_time = [RRTool getDateTimeStringWithDate:[NSDate date]];
            listModel.money = cardModel.money;
            listModel.status = @"1";
            listModel.pay_type_name = cardModel.today;
            [RRTool storeOrderList:listModel];
            
            if ([cardModel.card_type isEqualToString:@"qinqinxindai6"]) {
                [[QQXDManager shareInstance]increaseWeiBiWithAmount:60 reason:@"亲亲币充值"];
                
                // Remove the transaction from the payment queue.
                [Utilities alertWithTitle:@"充值成功~" message:[NSString stringWithFormat:@"恭喜您成功充值%.f亲亲币!",60.0] ConfirmTitle:@"确定" cancelTitle:nil controller:self Confirm:^{
                } cancelAction:^{
                    
                }];
                
            }else if ([cardModel.card_type isEqualToString:@"qinqinxindai7"]) {
                //增加充值订单
                
                //增加VIP时间
                WTUserInfoModel * userinfoModel = [RRTool getCurrentUserModel];
                userinfoModel.huiyuanDays = [RRTool addDateWithData:userinfoModel.huiyuanDays Days:7];
                [RRTool storeCurrentUserModel:userinfoModel];
                
                [Utilities alertWithTitle:@"青铜会员购买成功~" message:@"恭喜您成功购买青铜会员，快去免费抢单吧!" ConfirmTitle:@"马上抢单" cancelTitle:@"稍后再说" controller:self Confirm:^{
                    __pushWithClassName(@"QFLC_ClientListVC");
                } cancelAction:^{
                   
                }];
            }else{
                //增加VIP时间
                WTUserInfoModel * userinfoModel = [RRTool getCurrentUserModel];
                userinfoModel.huiyuanDays = [RRTool addDateWithData:userinfoModel.huiyuanDays Days:30];
                [RRTool storeCurrentUserModel:userinfoModel];

                
                
                [Utilities alertWithTitle:@"钻石会员购买成功~" message:@"恭喜您成功购买钻石会员，快去免费抢单吧!" ConfirmTitle:@"马上抢单" cancelTitle:@"稍后再说" controller:self Confirm:^{
                    __pushWithClassName(@"QFLC_ClientListVC");
                } cancelAction:^{
                    
                }];
            }
        }
        else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];

            [self.view makeToast:@"购买失败"];
        }
        
       

    }];
}




#pragma mark - delegate && dataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count?1:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        

    QFLC_RechargeCell * cell = [tableView dequeueReusableCellWithIdentifier:RECHARGE_CELL];
    if (!cell) {
        cell = [[QFLC_RechargeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RECHARGE_CELL];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.cardArray = _dataArr;
    __weak typeof(self)weakSelf = self;

    [cell setTapCardsBlock:^(NSInteger tag) {

        NSInteger index = 0;
        for (CardsModel *model in weakSelf.dataArr) {
            if (model.isChoose) {
                break;
            }
            index++;
        }
        if (tag == index) {
            return;
        }
        CardsModel *model = self.dataArr[tag];
        CardsModel *reModel = self.dataArr[weakSelf.reTag];
        reModel.isChoose = NO;
        model.isChoose = YES;
        weakSelf.reTag = tag;
        weakSelf.bottomView.cardModel = model;

        
        [weakSelf.customTableView reloadData];
        
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return APP_HEIGHT_6S(147.0);

}




#pragma mark --lazy
- (RechargeBottomView *)bottomView{
    @WeakObj(self);
    if (!_bottomView) {
        self.bottomView = [[RechargeBottomView alloc] initWithFrame:CGRectMake(0, KSCREEN_HEIGHT - APP_HEIGHT_6S(60.0), APP_WIDTH_6S(375.0), APP_HEIGHT_6S(60.0))];
        self.bottomView.cardModel = self.dataArr[0];
        _bottomView.buyCardBlock = ^(CardsModel * _Nonnull cardModel) {
            [selfWeak payBtnActionWithCardModel:cardModel];
        };
    }
    return _bottomView;
}

- (UIView *)footerView{
    if (!_footerView) {
        
        self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 600)];
        
        UITextView * footerTV = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, KWIDTH-40, 560)];
        footerTV.textColor = hexColor(a4a4a4);
        footerTV.font = appFont(14);
        footerTV.editable = NO;
        footerTV.text = @"•使用方式:在所购会员使用期限内，抢单成功后扣除会员当日免费抢单机会，抢单机会仅限当日有效，不可累积\n•会员时间顺延说明:\n① 会员天数按购买会员的时间自动顺延 ② 同一时间不能同时享受两种会员权益，必须当下的会员时间结束，才可继续享受另一会员权益\n③ 目前会员顺延顺序不支持调整，会员时间不支持增减。 如:张经理购买了青铜会员，发现自动匹配太少，于是又购买了钻石会员。钻石会员只能等青铜会员时间结束了才能开始生效，并不能累加免费订单单数，也不能先使用钻石会员再使用青铜会员，更不能直接不用青铜会员\n•注意事项: ① 信货经理通过实名认证后可享受会员权益，如尚未进行实名认证请提交相关资料申请 ② 会员权益仅限通过认证的信货经理本人使用， 若发现转让至他人或冒用他人身份信息的，亲亲信贷有权终止其会员权益，并追究相应责任 ③ 会员专区订单数量甶经理所在城市的订单供需关系决定，无法避免没有免费单的情况，可谨慎购买会员 ④ 亲亲信贷对会员权益拥有最终解释权，如有疑问可咨询亲亲信贷APP客服 ";
        [_footerView addSubview:footerTV];
    }
    return _footerView;
}


- (UITableView *)customTableView{
    if (!_customTableView) {
        _customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, APP_WIDTH_6S(375.0), self.bottomView.y - SafeAreaTopHeight) style:UITableViewStylePlain];
        _customTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _customTableView.delegate = self;
        _customTableView.dataSource = self;
        _customTableView.showsVerticalScrollIndicator = NO;
        _customTableView.showsHorizontalScrollIndicator = NO;
//        _customTableView.tableHeaderView = self.tableHeaderView;
        _customTableView.tableFooterView = self.footerView;
        if (@available(iOS 11.0, *)) {
            _customTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
        }
    }
    return _customTableView;
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];

        CardsModel * model = [CardsModel new];
        model.money = @"6";
        model.today = @"60枚亲亲币";
        model.cid = @"6";
        model.isChoose = YES;
        model.card_type = @"qinqinxindai6";
        [_dataArr addObject:model];
        
        CardsModel * model1 = [CardsModel new];
        model1.money = @"25";
        model1.today = @"青铜会员周卡";
        model1.cid = @"6";
        model1.card_type = @"qinqinxindai7";

        [_dataArr addObject:model1];
        
        CardsModel * model2 = [CardsModel new];
        model2.money = @"60";
        model2.today = @"钻石会员月卡";
        model2.cid = @"6";
        model2.card_type = @"qinqinxindai30";

        [_dataArr addObject:model2];
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
