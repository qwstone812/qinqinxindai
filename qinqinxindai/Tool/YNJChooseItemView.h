//
//  YNJChooseItemView.h
//  XiaoHengPuHuiJieTiao
//
//  Created by Miley on 2020/9/22.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SelectAction)(NSString * _Nullable result,NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface YNJChooseItemView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy)SelectAction selectAction;
@property (nonatomic,strong)NSString * titleStr;
@property (nonatomic,strong)NSString * selectString;

@property (nonatomic,strong)NSArray * items;
@property (nonatomic,strong)UITableView * listTV;
-(instancetype)initWithTitle:(NSString *)title items:(NSArray *)items selectAction:(SelectAction)selectAction;
-(void)show;
@end

NS_ASSUME_NONNULL_END
