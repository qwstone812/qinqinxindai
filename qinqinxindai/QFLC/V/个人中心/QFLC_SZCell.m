//
//  QFLC_SZCell.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_SZCell.h"

@implementation QFLC_SZCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLab];
        [self alertSwitch];
    }
    return self;
}
- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        [self addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self, 19)
        .widthIs(100)
        .heightIs(15);
        _titleLab.text = @"管理提醒";
        _titleLab.font = appFont(16);
        _titleLab.textColor = UIBlackColor;
    }
    return _titleLab;
}
- (UISwitch *)alertSwitch{
    if (_alertSwitch == nil) {
        _alertSwitch = [[UISwitch alloc]init];
        [self addSubview:self.alertSwitch];
        _alertSwitch.sd_layout
        .rightSpaceToView(self, 15)
        .topSpaceToView(self, 11.5)
        .widthIs(57)
        .heightIs(27);
    }
    return _alertSwitch;
    
    
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
