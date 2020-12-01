//
//  QFLC_ClientTopCell.h
//  DaiWorld
//
//  Created by zrmac on 11.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFLC_MineTopItemView.h"
#import "LNMineDataView.h"
NS_ASSUME_NONNULL_BEGIN

@interface QFLC_ClientTopCell : UITableViewCell
@property (nonatomic,strong)UIImageView *bigView;
@property (nonatomic,strong)UIImageView *txImgV;
@property (nonatomic,strong)UIImageView *setImgV;
@property (nonatomic,strong)UILabel *nameLab;


@property (nonatomic,strong)LNMineDataView          *dataView;

@property (nonatomic,strong)QFLC_MineTopItemView    *itemView;



@property (nonatomic,strong)UIImageView        *backImV;
@property (nonatomic,strong)UIImageView        *callImV;
@property (nonatomic,strong)UILabel            *titleLab;




@end

NS_ASSUME_NONNULL_END
