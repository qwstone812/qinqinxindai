//
//  QFLC_ClientDataCell.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientDataCell.h"


@interface QFLC_ClientDataCell()
@property (nonatomic,strong)UIView              *bgView;
//@property (nonatomic,strong)UIView              *lineView;
@property (nonatomic,strong)UILabel              *titleLab;

@end
@implementation QFLC_ClientDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = hexColor(f2f2f2);
        
        [self bgView];
        [self titleLab];
        [self cityView];
        [self ageView];
        [self dateView];
        [self jobView];
        [self incomeView];
    }
    return self;
}

- (UIView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]init];
        _bgView.userInteractionEnabled = YES;
        UDOnlyViewRadius(_bgView, 5);
        _bgView.backgroundColor = UIWhiteColor;
        [self.contentView addSubview:self.bgView];
        _bgView.sd_layout
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, 0)
        .widthIs(KWIDTH-40)
        .heightIs(280);
        
        
    }
    return _bgView;
}


- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"基本资料";
        [self.bgView addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self.bgView, 10)
        .topSpaceToView(self.bgView, 0)
        .widthIs(200)
        .heightIs(34);
        _titleLab.font = appFont(14);
        _titleLab.textColor = ThemeColor;
        
        UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 34, KWIDTH-40, 1)];
        line1.backgroundColor = hexColor(f7f7f7);
        [self.bgView addSubview:line1];
    }
    return _titleLab;
}





- (QFLC_ClientDataView *)cityView{
    if (_cityView == nil) {
        _cityView = [[QFLC_ClientDataView alloc]init];
        _cityView.backgroundColor = UIWhiteColor;
        _cityView.titleLab.text = @"所在城市";
        [self.bgView addSubview:self.cityView];
        _cityView.sd_layout
        .leftSpaceToView(self.bgView, 0)
        .topSpaceToView(self.bgView, 35)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _cityView;
}

- (QFLC_ClientDataView *)ageView{
    if (_ageView == nil) {
        _ageView = [[QFLC_ClientDataView alloc]init];
        _ageView.backgroundColor = UIWhiteColor;
        _ageView.titleLab.text = @"年龄";
        [self.bgView addSubview:self.ageView];
        _ageView.sd_layout
        .leftSpaceToView(self.bgView, 0)
        .topSpaceToView(self.cityView, 0)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _ageView;
}

- (QFLC_ClientDataView *)dateView{
    if (_dateView == nil) {
        _dateView = [[QFLC_ClientDataView alloc]init];
        _dateView.backgroundColor = UIWhiteColor;
        _dateView.titleLab.text = @"申请日期";
        [self.bgView addSubview:self.dateView];
        _dateView.sd_layout
        .leftSpaceToView(self.bgView, 0)
        .topSpaceToView(self.ageView, 0)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _dateView;
}

- (QFLC_ClientDataView *)jobView{
    if (_jobView == nil) {
        _jobView = [[QFLC_ClientDataView alloc]init];
        _jobView.backgroundColor = UIWhiteColor;
        _jobView.titleLab.text = @"职业身份";
        [self.bgView addSubview:self.jobView];
        _jobView.sd_layout
        .leftSpaceToView(self.bgView, 0)
        .topSpaceToView(self.dateView, 0)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _jobView;
}

- (QFLC_ClientDataView *)incomeView{
    if (_incomeView == nil) {
        _incomeView = [[QFLC_ClientDataView alloc]init];
        _incomeView.backgroundColor = UIWhiteColor;
        _incomeView.titleLab.text =@"收入";
        [self.bgView addSubview:self.incomeView];
        _incomeView.sd_layout
        .leftSpaceToView(self.bgView, 0)
        .topSpaceToView(self.jobView, 0)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _incomeView;
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
