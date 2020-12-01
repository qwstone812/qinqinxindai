//
//  rechargeOrderCell.m
//  ZYJSVPN
//
//  Created by mac on 2018/12/26.
//  Copyright © 2018年 ZrteC. All rights reserved.
//

#import "rechargeOrderCell.h"

@interface rechargeOrderCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *paymentStatus;

@end

@implementation rechargeOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)configUIWithModel:(OrderListModel *)model{
    self.timeLabel.text = model.create_time;
        self.paymentMethodLabel.text = @"苹果内购";
    
    
    self.moneyLabel.text = model.money;
    NSString *statusStr;
    if ([model.status isEqualToString:@"0"]) {
        statusStr = @"支付失败";
        self.paymentStatus.textColor = [UIColor colorWithHexString:@"#917EFF"];
    }else if ([model.status isEqualToString:@"1"]){
        statusStr = @"支付成功";
        self.paymentStatus.textColor = [UIColor colorWithHexString:@"#333333"];
    }else{
        statusStr = @"退款";
        self.paymentStatus.textColor = [UIColor colorWithHexString:@"#BDBDBD"];
    }
    self.paymentStatus.text = statusStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
