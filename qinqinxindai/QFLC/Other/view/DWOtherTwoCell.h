//
//  DWOtherTwoCell.h
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWOtherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DWOtherTwoCell : UITableViewCell
@property (nonatomic,strong)UIImageView *logoImgV;
@property (nonatomic,strong)UILabel *nameLab;

@property (nonatomic,strong)UIView *lablesView;


@property (nonatomic,strong)UILabel *peopleNumLab;
@property (nonatomic,strong)UILabel *moneyLab;
@property (nonatomic,strong)UILabel *rateLab;
@property (nonatomic,strong)UILabel *moneyTitleLab;
@property (nonatomic,strong)UILabel *dayLab;
@property (nonatomic,strong)UIImageView *applyForBtn;
@property (nonatomic,strong)UILabel *applyLab;
@property (nonatomic,strong)NSMutableArray  *labels;

- (void)setModel:(DWOtherModel *)model;
@end

NS_ASSUME_NONNULL_END
