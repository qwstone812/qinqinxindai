//
//  DWOtherTwoCell.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherTwoCell.h"
@interface DWOtherTwoCell ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *rateTitleLab;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIImageView *iconImgView;
@end
@implementation DWOtherTwoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self logoImgV];
        [self nameLab];
        [self peopleNumLab];
        [self moneyLab];
        [self lineView];
        [self rateLab];
        [self moneyTitleLab];
        [self rateTitleLab];
        [self applyForBtn];
        [self bottomLineView];
        [self iconImgView];
        [self dayLab];
        
        [self applyLab];
        UIView * grayView = [[UIView alloc]init];
        [self addSubview:grayView];
        grayView.sd_layout
        .leftSpaceToView(self, 0)
        .bottomSpaceToView(self, 0)
        .widthIs(KWIDTH)
        .heightIs(5);
        grayView.backgroundColor = hexColor(F5F5F5);
        _labels = [NSMutableArray array];
    }
    return self;
}
- (UIImageView *)logoImgV{
    if (_logoImgV == nil) {
        _logoImgV = [[UIImageView alloc]init];
        [self addSubview:self.logoImgV];
        _logoImgV.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self, 11)
        .widthIs(35)
        .heightIs(35);
//        _logoImgV.layer.cornerRadius = 15;
//        _logoImgV.layer.masksToBounds = YES;
    }
    return _logoImgV;
}
- (UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc]init];
        [self addSubview:self.nameLab];
        _nameLab.sd_layout
        .leftSpaceToView(self.logoImgV, 10)
        .topSpaceToView(self, 20)
        .widthIs(60)
        .heightIs(14);
        _nameLab.font = [UIFont fontWithName:@"Arial Rounded MT Bold"  size:(14.0)];
    }
    return _nameLab;
}
- (UILabel *)peopleNumLab{
    if (_peopleNumLab == nil) {
        _peopleNumLab = [[UILabel alloc]init];
        [self addSubview:self.peopleNumLab];
        _peopleNumLab.sd_layout
        .rightSpaceToView(self, 15)
        .topSpaceToView(self, 20)
        .widthIs(150)
        .heightIs(12);
        _peopleNumLab.font = appFont(12);
        _peopleNumLab.textAlignment = NSTextAlignmentRight;
        _peopleNumLab.textColor =hexColor(666666);
    }
    return _peopleNumLab;
}
- (UILabel *)moneyLab{
    if (_moneyLab == nil) {
        _moneyLab = [[UILabel alloc]init];
        [self addSubview:self.moneyLab];
        _moneyLab.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self.logoImgV, 14)
        .widthIs(120)
        .heightIs(16);
        _moneyLab.font = [UIFont fontWithName:@"PingFang-SC-Bold" size: 17];
        _moneyLab.textColor = DCThemeColor;
    }
    return _moneyLab;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        [self addSubview:self.lineView];
        _lineView.sd_layout
        .leftSpaceToView(self.moneyLab, 15)
        .topSpaceToView(self.logoImgV, 14)
        .widthIs(1)
        .heightIs(40);
        _lineView.backgroundColor = hexColor(ededed);
    }
    return _lineView;
}

- (UILabel *)rateLab{
    if (_rateLab == nil) {
        _rateLab = [[UILabel alloc]init];
        [self addSubview:self.rateLab];
        _rateLab.sd_layout
        .leftSpaceToView(self.lineView, 15)
        .topSpaceToView(self.logoImgV, 14)
        .widthIs(140)
        .heightIs(16);
        _rateLab.font = [UIFont fontWithName:@"PingFang-SC-Bold" size: 17];
        _rateLab.textColor = DCThemeColor;
    }
    return _rateLab;
}
- (UILabel *)moneyTitleLab{
    if (_moneyTitleLab == nil) {
        _moneyTitleLab = [[UILabel alloc]init];
        [self addSubview:self.moneyTitleLab];
        _moneyTitleLab.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self.moneyLab, 6.5)
        .widthIs(100)
        .heightIs(13);
        _moneyTitleLab.text = @"额度范围（元）";
        _moneyTitleLab.font = appFont(10);
        _moneyTitleLab.textColor = hexColor(808080);
    }
    return _moneyTitleLab;
}
- (UILabel *)rateTitleLab {
    if (_rateTitleLab == nil) {
        _rateTitleLab = [[UILabel alloc] init];
        [self addSubview:self.rateTitleLab];
        _rateTitleLab.sd_layout
        .leftSpaceToView(self.lineView, 15)
        .topSpaceToView(self.rateLab, 6.5)
        .widthIs(100)
        .heightIs(13);
        _rateTitleLab.text = @"日利率";
        _rateTitleLab.font = appFont(10);
        _rateTitleLab.textColor = hexColor(808080);
    }
    return _rateTitleLab;
}
- (UIView *)bottomLineView {
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] init];
        [self addSubview:self.bottomLineView];
        _bottomLineView.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self.moneyTitleLab, 10)
        .widthIs(KWIDTH - 30)
        .heightIs(1);
        _bottomLineView.backgroundColor = hexColor(f5f5f5);
    }
    return _bottomLineView;
}

- (UIImageView *)iconImgView {
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.image =[UIImage imageNamed:@"简介"];
//        [_iconImgView setImage:YBNameImage(@"mj_home_intro")];
        [self addSubview:self.iconImgView];
        _iconImgView.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self.bottomLineView, 10)
        .widthIs(13)
        .heightIs(16);
    }
    return _iconImgView;
}
- (UILabel *)dayLab{
    if (_dayLab == nil) {
        _dayLab = [[UILabel alloc]init];
        [self addSubview:self.dayLab];
        _dayLab.sd_layout
        .leftSpaceToView(self.iconImgView, 10)
        .topSpaceToView(self.bottomLineView, 10)
        .widthIs(KWIDTH - 48 - 15)
        .heightIs(13);
        _dayLab.font = appFont(13);
        _dayLab.textColor = hexColor(666666);
    }
    return _dayLab;
}
- (UIImageView *)applyForBtn{
    if (_applyForBtn == nil) {
        _applyForBtn = [[UIImageView alloc]init];
        [self addSubview:self.applyForBtn];
        _applyForBtn.sd_layout
        .rightSpaceToView(self, 15.5)
        .topSpaceToView(self.logoImgV, 15)
        .widthIs(71)
        .heightIs(27);

    }
    return _applyForBtn;
}
- (UILabel *)applyLab{
    if (_applyLab == nil) {
        _applyLab = [[UILabel alloc]init];
        [self.applyForBtn addSubview:self.applyLab];
        _applyLab.sd_layout
        .leftSpaceToView(self.applyForBtn, 0)
        .topSpaceToView(self.applyForBtn, 0)
        .widthIs(self.applyForBtn.width)
        .heightIs(self.applyForBtn.height-4);
        _applyLab.textColor = UIWhiteColor;
        _applyLab.textAlignment = NSTextAlignmentCenter;
        _applyLab.font = appFont(12);
        _applyLab.text = @"立即申请";
        _applyLab.backgroundColor = hexColor(509CFE);
        _applyLab.textColor = [UIColor whiteColor];
        _applyLab.layer.cornerRadius = 11.5;
        _applyLab.layer.masksToBounds = YES;
    }
    return _applyLab;
}

- (void)setModel:(DWOtherModel *)model{

    [self.logoImgV sd_setImageWithURL:[NSURL URLWithString:model.product_logo]];
    self.nameLab.text = model.pname;
    CGSize maximumLabelSize = CGSizeMake(100, 9999);
    CGSize expectSize = [self.nameLab sizeThatFits:maximumLabelSize];
    self.nameLab.sd_layout
    .leftSpaceToView(self.logoImgV, 6)
    .topSpaceToView(self, 19)
    .widthIs(expectSize.width)
    .heightIs(14);
    NSString *keyName = model.apply_amount;
    NSString *string = [NSString stringWithFormat:@"%@人已申请",model.apply_amount];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = NSMakeRange([[attributedString string] rangeOfString:keyName].location, keyName.length);
    [attributedString addAttribute:NSForegroundColorAttributeName value:DCThemeColor range:range];
    self.peopleNumLab.attributedText = attributedString;
    NSString * minimum_amount = [model.minimum_amount floatValue] > 100000 ? [NSString stringWithFormat:@"%.0f万",[model.minimum_amount floatValue] / 10000.0] : model.minimum_amount;
    NSString * maxmum_amount = [model.maximum_amount floatValue] > 100000 ? [NSString stringWithFormat:@"%.0f万",[model.maximum_amount floatValue] / 10000.0] : model.maximum_amount;
    self.moneyLab.text = [NSString stringWithFormat:@"%@~%@",minimum_amount,maxmum_amount];
    self.rateLab.text = [NSString stringWithFormat:@"%@%%",model.min_algorithm];
    self.dayLab.text = model.product_introduction;

    
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
