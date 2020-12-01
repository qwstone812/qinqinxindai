//
//  OrderCell.m
//  ZYJSVPN
//
//  Created by mac on 17.12.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "OrderCell.h"
@interface OrderCell ()

@property (nonatomic, strong) UILabel       *timeLabel;
@property (nonatomic, strong) UILabel       *moneyLabel;
@property (nonatomic, strong) UILabel       *typeLabel;
@property (nonatomic, strong) UILabel       *statusLabel;

@end

@implementation OrderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self CreatOrderCell];
    }
    return self;
}


- (void)CreatOrderCell{
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(17.0), 0, APP_WIDTH_6S(341.0), APP_HEIGHT_6S(92.0))];
    bg.image = [UIImage imageNamed:@"mine_rechargeOrder_cellBg.png"];
    [self.contentView addSubview:bg];

    
    ///时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(15.0), APP_HEIGHT_6S(13.0), APP_WIDTH_6S(200.0), APP_HEIGHT_6S(14.0))];
    _timeLabel.textColor = [UIColor colorWithHexString:@"#BDBDBD"];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(12.0)];
    [bg addSubview:_timeLabel];
    
    ///价格
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(15.0), APP_HEIGHT_6S(25.0) + _timeLabel.bottom, APP_WIDTH_6S(100.0), APP_HEIGHT_6S(24.0))];
    _moneyLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _moneyLabel.textAlignment = NSTextAlignmentLeft;
    _moneyLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(20.0)];
    [bg addSubview:_moneyLabel];
    
    ///状态
    self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(220.0), APP_HEIGHT_6S(25.0) + _timeLabel.bottom, APP_WIDTH_6S(100.0), APP_HEIGHT_6S(24.0))];
    _statusLabel.textAlignment = NSTextAlignmentRight;
    _statusLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(12.0)];
    [bg addSubview:_statusLabel];
    
   
    
    
}

- (void)setOrderModel:(OrderListModel *)orderModel{

    self.timeLabel.text = orderModel.create_time;
       
//    if ([orderModel.pay_type isEqualToString:@"4"]) {
//        self.paymentMethodLabel.text = @"苹果内购";
//    }
       
    self.moneyLabel.text = [NSString stringWithFormat:@"¥%@",orderModel.money];
    NSString *statusStr;
    if ([orderModel.status isEqualToString:@"0"]) {
        statusStr = @"支付失败";
        self.statusLabel.textColor = [UIColor colorWithHexString:@"#917EFF"];
    }else if ([orderModel.status isEqualToString:@"1"]){
        statusStr = @"支付成功";
        self.statusLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }else{
        statusStr = @"退款";
        self.statusLabel.textColor = [UIColor colorWithHexString:@"#BDBDBD"];
    }
    self.statusLabel.text = statusStr;
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
