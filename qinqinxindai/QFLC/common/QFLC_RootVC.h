//
//  QFLC_RootVC.h
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_RootVC : UIViewController
@property (nonatomic,strong)UITableView *djttableView;
-(void)reloadTableView;

@end

NS_ASSUME_NONNULL_END
