//
//  QFLC_HomeTopCell.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_HomeTopCell.h"

@implementation QFLC_HomeTopCell
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setViewStyle:_qflc_topBannerImgV];
    [self setViewStyle:_qflc_noticeView];
    [self setViewStyle:_qflc_itemsView];
    [_qflc_noticeView addTarget:self action:@selector(clickItem:)];
    [_qflcItem1 addTarget:self action:@selector(clickItem:)];
    [_qflc_Item2 addTarget:self action:@selector(clickItem:)];
    [_qflc_Item3 addTarget:self action:@selector(clickItem:)];
    [_qflc_Item4 addTarget:self action:@selector(clickItem:)];
    // Initialization code
}
-(void)clickItem:(UITapGestureRecognizer *)sender{
    if (_clickAction) {
        _clickAction(sender.view.tag);
    }
}
-(void)setViewStyle:(UIView *)view{
//    view.backgroundColor = [UIColor whiteColor];
     view.layer.shadowColor = [UIColor colorWithRed:185/255.0 green:182/255.0 blue:182/255.0 alpha:0.36].CGColor;
     view.layer.shadowOffset = CGSizeMake(0,0);
     view.layer.shadowOpacity = 1;
     view.layer.shadowRadius = 5;
     view.layer.cornerRadius = 5;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
