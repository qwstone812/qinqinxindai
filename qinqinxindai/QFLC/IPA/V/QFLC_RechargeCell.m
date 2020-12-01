//
//  QFLC_RechargeCell.m
//  DiShuiManager
//
//  Created by zrmac on 28.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_RechargeCell.h"

#import "CardsModel.h"
#import "rechargeButton.h"
@interface QFLC_RechargeCell()

@property (nonatomic, strong) UIImageView       *functionIcon;
@property (nonatomic, strong) UILabel           *functionLabel;


@end

@implementation QFLC_RechargeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatRechargeCell];
    }
    return self;
}


- (void)creatRechargeCell{
    
    //icon
    self.functionIcon = [[UIImageView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(21.0), APP_HEIGHT_6S(16.0), APP_WIDTH_6S(18.0), APP_WIDTH_6S(18.0))];
    [self.contentView addSubview:_functionIcon];
    //title
    self.functionLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(12.0) + _functionIcon.right, APP_HEIGHT_6S(18.0), APP_WIDTH_6S(88.0), APP_HEIGHT_6S(14.0))];
    _functionLabel.textColor = hexColor(2E2F31);
    _functionLabel.textAlignment = NSTextAlignmentLeft;
    _functionLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
    [self.contentView addSubview:_functionLabel];
    
}

- (void)setCardArray:(NSArray *)cardArray{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    NSInteger index = 0;
    CGFloat button_width = APP_WIDTH_6S(107.0);
    CGFloat button_height = APP_HEIGHT_6S(144.0);
    for (CardsModel *model in cardArray) {
        rechargeButton *button = [[rechargeButton alloc] initWithFrame:CGRectMake(((button_width+3)*(index%3)+24), (button_height+3)*(index/3), button_width, button_height)];
        button.cid = model.cid;
        button.money = model.money;
        button.today = model.today;
        button.selected = model.isChoose;
        button.discountsType = model.card_type;
        
        button.tag = index;
        [self.contentView addSubview:button];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapButtonAction:)];
        [button addGestureRecognizer:tap];
        index++;
    }
    
}


- (void)tapButtonAction:(UITapGestureRecognizer *)tap{
    UIView *targetview = tap.view;
    
    
    self.tapCardsBlock(targetview.tag);
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
