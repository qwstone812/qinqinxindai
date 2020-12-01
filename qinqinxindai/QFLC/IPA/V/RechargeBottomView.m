//
//  RechargeBottomView.m
//  ZYJSVPN
//
//  Created by mac on 16.12.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "RechargeBottomView.h"

@interface RechargeBottomView()

@property (nonatomic, strong) UILabel           *priceLabel;
@property (nonatomic, strong) UILabel           *cardLabel;

@end

@implementation RechargeBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatRechargeBottomView];
    }
    return self;
}


- (void)creatRechargeBottomView{
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, 1)];
    lineView.backgroundColor = hexColor(f5f5f5);
    [self addSubview:lineView];
    
    //总价
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(20.0),  APP_HEIGHT_6S(7.0), APP_WIDTH_6S(210.0), APP_HEIGHT_6S(30.0))];
    _priceLabel.textColor = hexColor(383838);
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    _priceLabel.text = @"总价：";
    _priceLabel.font = [UIFont boldSystemFontOfSize:APP_HEIGHT_6S(15.0)];
    [self addSubview:_priceLabel];
    
    //卡片信息
    self.cardLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(20.0), _priceLabel.bottom, APP_WIDTH_6S(210.0), APP_HEIGHT_6S(17.0))];
    _cardLabel.textColor = hexColor(B8B8B8);
    _cardLabel.textAlignment = NSTextAlignmentLeft;
    _cardLabel.text = @"已选择";
    _cardLabel.font = [UIFont boldSystemFontOfSize:APP_HEIGHT_6S(12.0)];
    [self addSubview:_cardLabel];
    
    //购买按钮
    UIButton * buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame = CGRectMake(APP_WIDTH_6S(235.0), APP_HEIGHT_6S(3.0), APP_WIDTH_6S(125.0), APP_HEIGHT_6S(54.0));
    [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(bottomBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [buyBtn setBackgroundImage:[UIImage imageNamed:@"recharge_buybutton_bgImage"] forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(16.0)];
    [self addSubview:buyBtn];
    
}

- (void)bottomBtnClicked{
    if (self.buyCardBlock) {
        self.buyCardBlock(_cardModel);
    }
}

- (void)setCardModel:(CardsModel *)cardModel{
    _cardModel = cardModel;
    NSMutableAttributedString *agreeAttribut = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"总价：¥%@",cardModel.money]];
    [agreeAttribut addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#917EFF"] range:NSMakeRange(3, cardModel.money.length + 1)];
    [agreeAttribut addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:APP_HEIGHT_6S(12.0)] range:NSMakeRange(3, 1)];
    [agreeAttribut addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:APP_HEIGHT_6S(18.0)] range:NSMakeRange(4, cardModel.money.length)];
    _priceLabel.attributedText = agreeAttribut;
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    
    
    _cardLabel.text = cardModel.today;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
