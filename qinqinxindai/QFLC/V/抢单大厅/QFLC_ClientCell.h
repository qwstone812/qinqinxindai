//
//  QFLC_ClientCell.h
//  DiShuiManager
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_ClientCell : UITableViewCell

@property (nonatomic, strong) UILabel * nameLabel;
@property (nonatomic, strong) UILabel * termLabel;

@property (nonatomic, strong) YDButton * itemBtn;
@property (nonatomic, strong) UILabel * moneyTitleLabel;
@property (nonatomic, strong) UILabel * moneyLabel;
@property (nonatomic, strong) UILabel * explianLabel;
@end

NS_ASSUME_NONNULL_END
