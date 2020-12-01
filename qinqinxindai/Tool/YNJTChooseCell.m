//
//  YNJTChooseCell.m
//  XiGuaJieTiao
//
//  Created by Miley on 2020/9/26.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "YNJTChooseCell.h"

@implementation YNJTChooseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView * line = [UIView new];
    [self.contentView addSubview:line];
    line.backgroundColor = hexColor(eeeeee);
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    _line = line;
    _titleL.font = appFont(14);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
