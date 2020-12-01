//
//  QFLC_ClientDataCell.h
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFLC_ClientDataView.h"
NS_ASSUME_NONNULL_BEGIN

@interface QFLC_ClientDataCell : UITableViewCell

@property (nonatomic,strong)QFLC_ClientDataView *cityView;
@property (nonatomic,strong)QFLC_ClientDataView *ageView;
@property (nonatomic,strong)QFLC_ClientDataView *dateView;
@property (nonatomic,strong)QFLC_ClientDataView *jobView;
@property (nonatomic,strong)QFLC_ClientDataView *incomeView;
@end

NS_ASSUME_NONNULL_END
