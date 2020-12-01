//
//  QFLC_ClientCell.m
//  DiShuiManager
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientCell.h"

@implementation QFLC_ClientCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatZhongAnHomeCell];
    }
    return self;
}

- (void)creatZhongAnHomeCell{
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(20), 0, APP_WIDTH_6S(335.0), APP_HEIGHT_6S(175.0))];
    UDOnlyViewRadius(bg, 5);
    bg.backgroundColor = UIWhiteColor;
    bg.layer.borderWidth = 1;
    bg.layer.borderColor = hexColor(f2f2f2).CGColor;
    [self.contentView addSubview:bg];

    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, APP_HEIGHT_6S(50.0))];
    _nameLabel.text = @"王勋";
    _nameLabel.textColor = hexColor(00040e);
    _nameLabel.font = appFont(18);
    [bg addSubview:_nameLabel];
    
    self.termLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(335.0)-210, 0, 200, APP_HEIGHT_6S(50.0))];
    _termLabel.text = @"32个月";
    _termLabel.textColor = hexColor(ad4132);
    _termLabel.textAlignment = NSTextAlignmentRight;
    _termLabel.font = appFont(18);
    [bg addSubview:_termLabel];

    UIView * topLine = [[UIView alloc] initWithFrame:CGRectMake(0, _nameLabel.bottom, APP_WIDTH_6S(335.0), 1)];
    topLine.backgroundColor = hexColor(f7f7f7);
    [bg addSubview:topLine];


    self.itemBtn = [YDButton buttonWithFrame:CGRectMake(APP_WIDTH_6S(235.0), _nameLabel.bottom + APP_HEIGHT_6S(43.0),APP_WIDTH_6S(80.0), APP_HEIGHT_6S(28.0)) title:@"抢单"];
    [_itemBtn setTitleColor:[UIColor whiteColor]];
//    [_itemBtn setBgColor:[UIColor colorWithHexColorString:@"5c87db"]];
    [_itemBtn setBgColor:ThemeColor];

    _itemBtn.titleLabel.font=[UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
//    [itemBtn addTarget:self action:@selector(querenAction) forControlEvents:UIControlEventTouchUpInside];
    _itemBtn.enabled = NO;
    [bg addSubview:_itemBtn];

    //已借金额
    self.moneyTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, topLine.bottom + APP_HEIGHT_6S(10.0), 200, APP_HEIGHT_6S(30.0))];
    _moneyTitleLabel.text = @"金额（元）";
    _moneyTitleLabel.textColor = hexColor(656972);
    _moneyTitleLabel.font = appFont(16);
    [bg addSubview:_moneyTitleLabel];

    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _moneyTitleLabel.bottom, 200, APP_HEIGHT_6S(50.0))];
    _moneyLabel.text = @"19,500.00";
    _moneyLabel.textColor = hexColor(242b32);
    _moneyLabel.font = [UIFont boldSystemFontOfSize:30];//appFont(30);
    [bg addSubview:_moneyLabel];


    self.explianLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, APP_HEIGHT_6S(150.0), APP_WIDTH_6S(335.0)-10, APP_HEIGHT_6S(15.0))];
    _explianLabel.text = @"公积金|社保|医保";
    _explianLabel.textColor = hexColor(656972);
    _explianLabel.font = appFont(12);
    [bg addSubview:_explianLabel];
    
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
