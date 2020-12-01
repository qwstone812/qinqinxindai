//
//  QFLC_ForumCell.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ForumCell.h"

@interface QFLC_ForumCell()



@end
@implementation QFLC_ForumCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = hexColor(f8faff);
        [self creatCell];
    }
    return self;
    
}

- (void)creatCell{
    
    //背景
    UIView *matchBG = [[UIView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(20.0), APP_HEIGHT_6S(20.0), APP_WIDTH_6S(335.0), APP_HEIGHT_6S(210.0))];
    matchBG.backgroundColor = [UIColor whiteColor];
    matchBG.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.08].CGColor;
    matchBG.layer.shadowOffset = CGSizeMake(0,2);
    matchBG.layer.shadowOpacity = 1;
    matchBG.layer.shadowRadius = 9;
    matchBG.layer.cornerRadius = 5;
    [self.contentView addSubview:matchBG];
    
    //赛事图片
    self.matchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH_6S(335.0), APP_HEIGHT_6S(167.0))];
    self.matchIcon.layer.cornerRadius = 0;
    [self.matchIcon addRoundedCorners:UIRectCornerTopRight | UIRectCornerTopLeft withRadii:CGSizeMake(APP_HEIGHT_6S(5.0), APP_HEIGHT_6S(5.0))];
    [matchBG addSubview:_matchIcon];
    
    
    
    //    //赛事名称
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(15.0) , _matchIcon.bottom, APP_WIDTH_6S(305.0), APP_HEIGHT_6S(43.0))];
    _titleLabel.textColor = hexColor(2E2F31);
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
    [matchBG addSubview:_titleLabel];
    
    
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
