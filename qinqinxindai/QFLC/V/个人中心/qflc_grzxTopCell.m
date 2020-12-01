//
//  qflc_grzxTopCell.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "qflc_grzxTopCell.h"
@implementation qflc_grzxTopCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ThemeColor;
        [self bigView];
        [self itemView];
        [self txImgV];
        [self setImgV];
        [self nameLab];
        [self vipImgV];
        [self vipLab];
//        [self dateLab];
    }
    return self;
}

- (QFLC_MineTopItemView *)itemView{
    if (_itemView == nil) {
        _itemView = [[QFLC_MineTopItemView alloc]init];
        _itemView.backgroundColor = UIWhiteColor;
        [self.contentView addSubview:self.itemView];
        _itemView.sd_layout
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, 140)
        .widthIs(KWIDTH-40)
        .heightIs(80);
        _itemView.layer.cornerRadius = 5;
        _itemView.layer.masksToBounds = YES;
    }
    return _itemView;
}

- (UIImageView *)bigView{
    if (_bigView == nil) {
        _bigView = [[UIImageView alloc]init];
        _bigView.userInteractionEnabled = YES;
//        _bigView.backgroundColor = the;
        [self.contentView addSubview:self.bigView];
        _bigView.sd_layout
        .leftSpaceToView(self.contentView, 0)
        .topSpaceToView(self.contentView, 150)
        .widthIs(KWIDTH)
        .heightIs(80);
        _bigView.image = [UIImage imageNamed:@"dxg_mine_topbg"];
    }
    return _bigView;
}
- (UIImageView *)txImgV{
    if (_txImgV == nil) {
        _txImgV = [[UIImageView alloc]init];
        _txImgV.userInteractionEnabled = YES;
        [self.contentView addSubview:self.txImgV];
        _txImgV.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, (150 - 60 + SafeAreaStatusHeight)/2)
        .widthIs(60)
        .heightIs(60);
    }
    return _txImgV;
}


- (UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.text = NICKNAME;
        [self.contentView addSubview:self.nameLab];
        _nameLab.sd_layout
        .leftSpaceToView(self.txImgV, 10)
        .topSpaceToView(self.contentView, (150 - 60 + SafeAreaStatusHeight)/2)
        .widthIs(200)
        .heightIs(20);
        _nameLab.font = [UIFont boldSystemFontOfSize:16];
        _nameLab.textColor = UIWhiteColor;
    }
    return _nameLab;
}


- (UILabel *)moneyLab{
    if (_moneyLab == nil) {
        _moneyLab = [[UILabel alloc]init];
        _moneyLab.text = @"余额：28亲亲币";
        [self.contentView addSubview:self.moneyLab];
        _moneyLab.sd_layout
        .leftSpaceToView(self.nameLab, 10)
        .topSpaceToView(self.contentView, (150 - 60 + SafeAreaStatusHeight)/2)
        .widthIs(200)
        .heightIs(20);
        _moneyLab.font = [UIFont boldSystemFontOfSize:16];
        _moneyLab.textColor = UIWhiteColor;
    }
    return _moneyLab;
}




- (UIImageView *)vipImgV{
    if (_vipImgV == nil) {
        _vipImgV = [[UIImageView alloc]init];
        _vipImgV.image = Img(@"VIP_zs");
        [self.contentView addSubview:self.vipImgV];
        _vipImgV.sd_layout
        .leftSpaceToView(self.txImgV, 10)
        .topSpaceToView(self.nameLab, 0)
        .widthIs(40)
        .heightIs(40);
    }
    return _vipImgV;
}

- (UILabel *)vipLab{
    if (_vipLab == nil) {
        _vipLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.vipLab];
        _vipLab.sd_layout
        .leftSpaceToView(self.vipImgV, 10)
        .topSpaceToView(self.nameLab, 0)
        .widthIs(180)
        .heightIs(40);
        _vipLab.font = appFont(18);
        _vipLab.textColor = UIWhiteColor;
    }
    return _vipLab;
}

- (UILabel *)dateLab{
    if (_dateLab == nil) {
        _dateLab = [[UILabel alloc]init];
        [self.contentView addSubview:self.dateLab];
        _dateLab.sd_layout
        .leftSpaceToView(self.vipImgV, 10)
        .topSpaceToView(self.vipLab, 0)
        .widthIs(180)
        .heightIs(20);
        _dateLab.font = appFont(18);
        _dateLab.textColor = UIWhiteColor;
    }
    return _dateLab;
}


- (UIImageView *)setImgV{
    if (_setImgV == nil) {
        _setImgV = [[UIImageView alloc]init];
        _setImgV.image = [UIImage imageNamed:@"mine_xufei"];
        [self.contentView addSubview:self.setImgV];
        _setImgV.sd_layout
        .leftSpaceToView(self.vipImgV, 180)
        .topSpaceToView(self.nameLab, 0)
        .widthIs(40)
        .heightIs(40);
    }
    return _setImgV;
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
