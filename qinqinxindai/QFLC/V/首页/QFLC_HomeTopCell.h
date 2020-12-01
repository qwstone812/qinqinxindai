//
//  QFLC_HomeTopCell.h
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ChooseAction)(NSInteger tag);

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_HomeTopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *qflc_topBannerImgV;
@property (weak, nonatomic) IBOutlet UIView *qflc_stateView;
@property (weak, nonatomic) IBOutlet UIView *qflc_noticeView;
@property (weak, nonatomic) IBOutlet UIView *qflc_itemsView;
@property (weak, nonatomic) IBOutlet UIView *qflcItem1;
@property (weak, nonatomic) IBOutlet UIView *qflc_Item2;
@property (weak, nonatomic) IBOutlet UIView *qflc_Item3;
@property (weak, nonatomic) IBOutlet UIView *qflc_Item4;
@property(nonatomic,strong)ChooseAction clickAction;
@end

NS_ASSUME_NONNULL_END
