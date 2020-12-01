//
//  QFLC_ClientTopCell.m
//  DaiWorld
//
//  Created by zrmac on 11.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientTopCell.h"


@implementation QFLC_ClientTopCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ThemeColor;
        [self bigView];
        [self backImV];
        [self titleLab];
        [self dataView];
        
        [self nameLab];
        
        
    }
    return self;
}

- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"客户详情";
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self.contentView, (KWIDTH-150)/2)
        .topSpaceToView(self.contentView, StatusBarHeight)
        .widthIs(150)
        .heightIs(44);
        _titleLab.font = appFont(20);
        _titleLab.textColor = UIWhiteColor;
    }
    return _titleLab;
}

- (UIImageView *)backImV{
    if (_backImV == nil) {
        _backImV = [[UIImageView alloc]init];
        _backImV.userInteractionEnabled = YES;
//        _bigView.backgroundColor = the;
        [self.contentView addSubview:self.backImV];
        _backImV.sd_layout
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, StatusBarHeight + 11)
        .widthIs(22)
        .heightIs(22);
        _backImV.image = [UIImage imageNamed:@"dxg_back"];
    }
    return _backImV;
}


- (UIImageView *)bigView{
    if (_bigView == nil) {
        _bigView = [[UIImageView alloc]init];
        _bigView.userInteractionEnabled = YES;
//        _bigView.backgroundColor = the;
        [self.contentView addSubview:self.bigView];
        _bigView.sd_layout
        .leftSpaceToView(self.contentView, 0)
        .topSpaceToView(self.contentView, 170)
        .widthIs(KWIDTH)
        .heightIs(80);
        _bigView.image = [UIImage imageNamed:@"dxg_mine_topbg"];
    }
    return _bigView;
}

- (UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.userInteractionEnabled = YES;
        _nameLab.text = @"";
        _nameLab.backgroundColor = UIWhiteColor;
        [self.contentView addSubview:self.nameLab];
        _nameLab.sd_layout
        .leftSpaceToView(self.contentView, (KWIDTH-300)/2)
        .topSpaceToView(self.contentView, 170)
        .widthIs(300)
        .heightIs(50);
        _nameLab.font = [UIFont boldSystemFontOfSize:18];
        _nameLab.textColor = hexColor(666666);
        
        _nameLab.layer.cornerRadius = 5;
        _nameLab.layer.masksToBounds = YES;
        
        _callImV = [[UIImageView alloc]init];
        _callImV.userInteractionEnabled = YES;
//        _bigView.backgroundColor = the;
        [self.nameLab addSubview:self.callImV];
        _callImV.sd_layout
        .rightSpaceToView(self.nameLab, 10)
        .topSpaceToView(self.nameLab, 10)
        .widthIs(30)
        .heightIs(30);
        _callImV.image = [UIImage imageNamed:@"orderr_call"];
        
        
        UILabel * callLab = [[UILabel alloc]init];
        callLab.text = @"电话号码已做处理，拨出为系统虚拟电话";
        callLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:callLab];
        callLab.sd_layout
        .leftSpaceToView(self.contentView, 0)
        .topSpaceToView(self.nameLab, 5)
        .widthIs(KWIDTH)
        .heightIs(15);
        callLab.font = [UIFont boldSystemFontOfSize:12];
        callLab.textColor = [UIColor lightGrayColor];
        
    }
    return _nameLab;
}




- (LNMineDataView *)dataView{
    if (_dataView == nil) {
        _dataView = [[LNMineDataView alloc]init];
//        _dataView.backgroundColor = UIWhiteColor;
        [self.contentView addSubview:self.dataView];
        _dataView.sd_layout
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, 90)
        .widthIs(KWIDTH-40)
        .heightIs(50);
    }
    return _dataView;
}

- (QFLC_MineTopItemView *)itemView{
    if (_itemView == nil) {
        _itemView = [[QFLC_MineTopItemView alloc]init];
        _itemView.backgroundColor = UIWhiteColor;
//        [self.contentView addSubview:self.itemView];
        _itemView.sd_layout
        .leftSpaceToView(self.contentView, 20)
        .topSpaceToView(self.contentView, 150)
        .widthIs(KWIDTH-40)
        .heightIs(80);
        _itemView.layer.cornerRadius = 5;
        _itemView.layer.masksToBounds = YES;
    }
    return _itemView;
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
