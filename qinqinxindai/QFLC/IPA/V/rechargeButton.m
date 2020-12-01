//
//  rechargeButton.m
//  ZYJSVPN
//
//  Created by mac on 2019/1/15.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import "rechargeButton.h"

typedef void(^SelectSelfBlock)(void);

@interface rechargeButton()

@property (nonatomic, strong)UIImageView *discountsIcon;


@property (nonatomic, strong)UIImageView *bgImageView;

@property (nonatomic, strong)UILabel *moneyLabel;

@property (nonatomic, strong)UILabel *todayLabel;

/**
 按钮的点击事件
 */
@property (nonatomic,copy) SelectSelfBlock selectBlcok;

@end

@implementation rechargeButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    //按钮背景
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH_6S(107.0), APP_HEIGHT_6S(144.0))];
    [self addSubview:self.bgImageView];
    //活动icon
    self.discountsIcon = [[UIImageView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(6.0), 0, APP_WIDTH_6S(58.0), APP_HEIGHT_6S(18.0))];
    [_bgImageView addSubview:self.discountsIcon];
    
    //价格
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(16.0), APP_HEIGHT_6S(20.0), APP_WIDTH_6S(85.0), APP_HEIGHT_6S(31.0))];
    _moneyLabel.textAlignment = NSTextAlignmentLeft;
    _moneyLabel.textColor = hexColor(917EFF);
    _moneyLabel.font = [UIFont boldSystemFontOfSize:28.0];
    [self addSubview:_moneyLabel];
    //名称
    self.todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, APP_HEIGHT_6S(100.0), APP_WIDTH_6S(107.0), APP_HEIGHT_6S(21.0))];
    _todayLabel.textColor = hexColor(B8B8B8);
    _todayLabel.textAlignment = NSTextAlignmentCenter;
    _todayLabel.font = [UIFont boldSystemFontOfSize:15.0];
    [self addSubview:_todayLabel];
    
  
}

- (void)setDiscountsType:(NSString *)discountsType{
    if ([discountsType isEqualToString:@"1"]) {
        [self.discountsIcon setImage:[UIImage imageNamed:@"discounts_MYSY"]];
    }else if ([discountsType isEqualToString:@"2"]){
        [self.discountsIcon setImage:[UIImage imageNamed:@"discounts_SCDYBJ"]];
    }else if ([discountsType isEqualToString:@"3"]){
        [self.discountsIcon setImage:[UIImage imageNamed:@"discounts_ZJXBJ"]];
    }else {
        [self.discountsIcon setImage:[UIImage imageNamed:@""]];
    }
    
}

- (void)setCid:(NSString *)cid{
    _cid = cid;
    if ([cid isEqualToString:@"1"]) {
        //连续包周卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_weeks_unselected.png"]];
    }else if ([cid isEqualToString:@"2"]){
        //连续包月卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_months_unselected"]];
    }else if ([cid isEqualToString:@"3"]){
        //七天卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_days_unselected"]];
    }else if ([cid isEqualToString:@"3"]){
        //月卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_month_unselected"]];
    }else if ([cid isEqualToString:@"3"]){
        //季卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_season_unselected"]];
    }else if ([cid isEqualToString:@"3"]){
        //半年卡
        [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_halfyears_unselected"]];
    }
}

- (void)setMoney:(NSString *)money{
    _money = money;
     NSMutableAttributedString *agreeAttribut = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",money]];
    [agreeAttribut addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:APP_HEIGHT_6S(16.0)] range:NSMakeRange(0, 1)];
    [agreeAttribut addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:APP_HEIGHT_6S(28.0)] range:NSMakeRange(1, money.length)];
    _moneyLabel.attributedText = agreeAttribut;
}

- (void)setToday:(NSString *)today{
    _today = today;
    [self.todayLabel setText:today];
}

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    if (_selected) {
        if ([_cid isEqualToString:@"1"]) {
            //连续包周卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_weeks_selected.png"]];
        }else if ([_cid isEqualToString:@"2"]){
            //连续包月卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_months_selected"]];
        }else if ([_cid isEqualToString:@"3"]){
            //七天卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_days_selected"]];
        }else if ([_cid isEqualToString:@"5"]){
            //月卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_month_selected"]];
        }else if ([_cid isEqualToString:@"6"]){
            //季卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_season_selected"]];
        }else if ([_cid isEqualToString:@"8"]){
            //半年卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_halfyears_selected"]];
        }
        self.moneyLabel.textColor = UIWhiteColor;
        self.todayLabel.textColor = UIWhiteColor;
    }else{
        if ([_cid isEqualToString:@"1"]) {
            //连续包周卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_weeks_unselected.png"]];
        }else if ([_cid isEqualToString:@"2"]){
            //连续包月卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_months_unselected"]];
        }else if ([_cid isEqualToString:@"3"]){
            //七天卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_days_unselected"]];
        }else if ([_cid isEqualToString:@"5"]){
            //月卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_month_unselected"]];
        }else if ([_cid isEqualToString:@"6"]){
            //季卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_season_unselected"]];
        }else if ([_cid isEqualToString:@"8"]){
            //半年卡
            [self.bgImageView setImage:[UIImage imageNamed:@"recharge_card_halfyears_unselected"]];
        }
        self.moneyLabel.textColor = hexColor(917EFF);
        self.todayLabel.textColor = hexColor(B8B8B8);
    }
}
//
///**
// 按钮的点击事件
//
// @param sender 按钮
// */
//- (void)selectButton:(void (^)(rechargeButton *btu))sender{
//    __weak typeof(self) weakSelf = self;
//    self.selectBlcok = ^{
//        sender(weakSelf);
//    };
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.selected = !self.selected;
//    if (self.selectBlcok) {
//        self.selectBlcok();
//    }
//}

@end
