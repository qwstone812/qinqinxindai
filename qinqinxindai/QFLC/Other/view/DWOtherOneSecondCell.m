//
//  DWOtherOneSecondCell.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherOneSecondCell.h"

@implementation DWOtherOneSecondCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self titleLab];
        [self subLab];
        [self lineLab];
    }
    return self;
}
- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        [self addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self, 15)
        .topSpaceToView(self, 0)
        .widthIs(100)
        .heightIs(39);
        _titleLab.font = appFont(13);
        _titleLab.textColor = hexColor(333333);
        _titleLab.text = @"热门推荐";
    }
    return _titleLab;
}
- (UILabel *)subLab{
    if (_subLab == nil) {
        _subLab = [[UILabel alloc]init];
        [self addSubview:self.subLab];
        _subLab.sd_layout
        .rightSpaceToView(self, 30)
        .topSpaceToView(self, 0)
        .widthIs(100)
        .heightIs(39);
        _subLab.textColor = hexColor(333333);
        _subLab.textAlignment = NSTextAlignmentRight;
        _subLab.text = @"更多产品";
        _subLab.font = appFont(11);
    }
    return _subLab;
}
- (UILabel *)lineLab{
    if (_lineLab == nil) {
        _lineLab = [[UILabel alloc]init];
        [self addSubview:self.lineLab];
        _lineLab.sd_layout
        .leftSpaceToView(self, 0)
        .topSpaceToView(self.titleLab, 0)
        .widthIs(KWIDTH)
        .heightIs(1);
        _lineLab.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    }
    return _lineLab;
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
