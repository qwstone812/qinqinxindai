//
//  QFLC_SZClearCell.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_SZClearCell.h"

@implementation QFLC_SZClearCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLab];
        [self rightImgV];
        [self subLab];
    }
    return self;
}
- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        [self addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self, 18)
        .widthIs(100)
        .heightIs(15);
        _titleLab.textColor = UIBlackColor;
        _titleLab.font = appFont(16);
    }
    return _titleLab;
}
- (UIImageView *)rightImgV{
    if (_rightImgV == nil) {
        _rightImgV = [[UIImageView alloc]init];
        [self addSubview:self.rightImgV];
        _rightImgV.sd_layout
        .rightSpaceToView(self, 15)
        .topSpaceToView(self, 17)
        .widthIs(9)
        .heightIs(17);
        _rightImgV.image = [UIImage imageNamed:@"箭头"];
    }
    return _rightImgV;
}
- (UILabel *)subLab{
    if (_subLab == nil) {
        _subLab = [[UILabel alloc]init];
        [self addSubview:self.subLab];
        _subLab.sd_layout
        .rightSpaceToView(self.rightImgV, 6)
        .topSpaceToView(self, 0)
        .widthIs(200)
        .heightIs(50);
        _subLab.font = appFont(16);
        _subLab.textColor = rgba(102, 102, 102, 1);
        _subLab.textAlignment = NSTextAlignmentRight;
    }
    return _subLab;
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
