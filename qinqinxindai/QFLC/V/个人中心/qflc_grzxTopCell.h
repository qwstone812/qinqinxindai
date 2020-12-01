//
//  qflc_grzxTopCell.h
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFLC_MineTopItemView.h"

NS_ASSUME_NONNULL_BEGIN

@interface qflc_grzxTopCell : UITableViewCell

@property (nonatomic,strong)UIImageView *bigView;
@property (nonatomic,strong)UIImageView *txImgV;
@property (nonatomic,strong)UIImageView *setImgV;
@property (nonatomic,strong)UILabel *nameLab;
@property (nonatomic,strong)UILabel *moneyLab;


@property (nonatomic,strong)UIImageView *vipImgV;
@property (nonatomic,strong)UILabel     *vipLab;
@property (nonatomic,strong)UILabel     *dateLab;


@property (nonatomic,strong)QFLC_MineTopItemView *itemView;
@end

NS_ASSUME_NONNULL_END
