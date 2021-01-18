//
//  DWOtherOneThirdCell.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherOneThirdCell.h"

@implementation DWOtherOneThirdCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self imgV];
    }
    return self;
}
- (UIImageView *)imgV{
    if (_imgV == nil) {
        _imgV = [[UIImageView alloc]init];
        [self addSubview:self.imgV];
        _imgV.sd_layout
        .leftSpaceToView(self, 10)
        .topSpaceToView(self, 4)
        .widthIs(KWIDTH - 20)
        .heightIs(62);
        _imgV.image = [UIImage imageNamed:@"小 banner"];
    }
    return _imgV;
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
