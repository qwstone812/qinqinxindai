//
//  DWOtherOneFirstCell.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherOneFirstCell.h"

@implementation DWOtherOneFirstCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bigImgV];
        [self titleLab];
        [self ammontLab];
        [self btnImg];
    }
    return self;
}
- (UIImageView *)bigImgV{
    if (_bigImgV == nil) {
        _bigImgV = [[UIImageView alloc]init];
        [self addSubview:self.bigImgV];
        _bigImgV.sd_layout
        .leftSpaceToView(self, 0)
        .topSpaceToView(self, 0)
        .widthIs(KWIDTH)
        .heightIs(195);
        _bigImgV.image = [UIImage imageNamed:@"cellOneB"];
    }
    return _bigImgV;
}
- (UILabel *)titleLab{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc]init];
        [self.bigImgV addSubview:self.titleLab];
        _titleLab.sd_layout
        .leftSpaceToView(self.bigImgV, 0)
        .topSpaceToView(self.bigImgV, 23)
        .widthIs(KWIDTH)
        .heightIs(14);
        _titleLab.font = appFont(14);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"预估可借金额(元)";
        _titleLab.textColor = rgba(102, 102, 102, 1);
    }
    return _titleLab;
}
- (UILabel *)ammontLab{
    if (_ammontLab == nil) {
        _ammontLab = [[UILabel alloc]init];
        [self.bigImgV addSubview:self.ammontLab];
        _ammontLab.sd_layout
        .leftSpaceToView(self.bigImgV, 0)
        .topSpaceToView(self.titleLab, 31)
        .widthIs(KWIDTH)
        .heightIs(35);
        _ammontLab.font = appFont(37.5);
        _ammontLab.textColor = rgba(51, 51, 51, 1);
        _ammontLab.textAlignment = NSTextAlignmentCenter;
        _ammontLab.text = @"50,000";
        [_ammontLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:37.5]];

    }
    return _ammontLab;
}
- (UIView *)btnImg{
    if (_btnImg == nil) {
        _btnImg = [[UIView alloc]init];
        [self.bigImgV addSubview:self.btnImg];
        _btnImg.sd_layout
        .leftSpaceToView(self.bigImgV, (self.bigImgV.width - 206)/2)
        .topSpaceToView(self.ammontLab, 22)
        .heightIs(37)
        .widthIs(206);
//        _btnImg.image = [UIImage imageNamed:@"home0910_btn_bg"];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = _btnImg.frame;
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)[UIColor colorWithRed:60/255.0 green:75/255.0 blue:237/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:83/255.0 green:124/255.0 blue:241/255.0 alpha:1.0].CGColor];
        gl.locations = @[@(0.0),@(1.0f)];
        
        
        _btnImg.layer.shadowColor = [UIColor colorWithRed:43/255.0 green:95/255.0 blue:223/255.0 alpha:0.29].CGColor;
        _btnImg.layer.shadowOffset = CGSizeMake(0,4);
        _btnImg.layer.shadowOpacity = 1;
        _btnImg.layer.shadowRadius = 4;
        _btnImg.layer.cornerRadius = 18.5;
        [self.btnImg.layer addSublayer:gl];

        _btnImg.layer.masksToBounds = YES;
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 206, 33)];
        lab.text = @"立即申请";
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = appFont(19);
        lab.textColor = UIWhiteColor;
        [self.btnImg addSubview:lab];
    }
    return _btnImg;
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
