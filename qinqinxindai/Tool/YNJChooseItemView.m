
//
//  WDSingleChooseView.m
//  WangDai
//
//  Created by Miley on 2018/12/20.
//  Copyright © 2018 wyh. All rights reserved.
//

#import "YNJChooseItemView.h"
#import "YNJTChooseCell.h"
#define KROWHEITHG 42.5
@implementation YNJChooseItemView
-(instancetype)initWithTitle:(NSString *)title items:(NSArray *)items selectAction:(SelectAction)selectAction{
    self = [super init];
    if (self) {
        self.titleStr =title;
//        self.selectString = selectedString;
//        if (![items containsObject:selectedString]) {
//            self.selectString = items[0];
//        }
        self.selectAction = selectAction;
        self.items = items;
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
//    [self.view addSubview:self.footerView];
//    [self.view addSubview:self.headerView];
    CGFloat f = ( DEVICE_IS_IPHONEX ? 34 : 0) + 22;
    self.frame = CGRectMake(0, 0, KWIDTH, KHEIGHT);
    self.backgroundColor = [UIColor clearColor];
    UIView * coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KHEIGHT)];
    coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addSubview:coverView];
    CGFloat  tableViewHeight = KROWHEITHG * self.items.count + 49;
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, KHEIGHT - tableViewHeight - f, KWIDTH, tableViewHeight + f)];
    [self addSubview:bottomView];
//    self.frame = CGRectMake(0, KHEIGHT - 45 - 48 * self.items.count - f, KWIDTH, 45 + 48 * self.items.count + f);
    _listTV = [[UITableView alloc]initWithFrame:CGRectMake(12.5, 0, KWIDTH - 25, tableViewHeight)style:UITableViewStylePlain];
    _listTV.delegate = self;
    _listTV.dataSource = self;
    _listTV.estimatedRowHeight = KROWHEITHG;
    _listTV.contentSize= CGSizeMake(0, 0);
    _listTV.rowHeight = UITableViewAutomaticDimension;
    _listTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    ViewForBorderRadius(_listTV, 7, 0, UIClearColor);
    [bottomView addSubview:_listTV];
    [_listTV registerNib:[UINib nibWithNibName:@"YNJTChooseCell" bundle:nil] forCellReuseIdentifier:@"YNJTChooseCell"];
    _listTV.backgroundColor = [UIColor whiteColor];
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 45)];
//    view.backgroundColor = hexColor(ebebeb);
//    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, KWIDTH - 160, 45)];
//    [view addSubview:label];
//    label.font = appFont(16);
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = _titleStr;
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(KWIDTH - 30, 15, 15, 15);
////    btn.backgroundColor = [UIColor redColor];
//    [btn setImage:[UIImage imageNamed:@"关闭弹框"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:btn];
//    _listTV.tableHeaderView = view;
}
-(void)closeAction {
    [self removeFromSuperview];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count + 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _items.count) {
        return 49;
    }
    return KROWHEITHG;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YNJTChooseCell * cell = [tableView dequeueReusableCellWithIdentifier:@"YNJTChooseCell"];
    if (indexPath.row == _items.count) {
        cell.titleL.text = @"取消";
        cell.titleL.textColor = hexColor(333333);
        cell.titleL.font = [UIFont boldSystemFontOfSize:18];
    }else{
        cell.titleL.text = _items[indexPath.row];
        if ([self.selectString isEqualToString: _items[indexPath.row]]) {
            cell.titleL.textColor = hexColor(333333);
            cell.titleL.font = [UIFont boldSystemFontOfSize:15];
        }else{
            cell.titleL.textColor = hexColor(999999);
            cell.titleL.font = [UIFont systemFontOfSize:15];
            //                       cell.selectImage.hidden = NO;
        }
    }
    if (indexPath.row == _items.count) {
        [cell.line removeFromSuperview];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != _items.count) {
        if (_selectAction) {
            _selectAction(_items[indexPath.row],indexPath.row);
        }
        self.selectString = _items[indexPath.row];
        [tableView reloadData];
    }
    
    [self removeFromSuperview];
}
-(void)show{
    [[Utilities appDelegate].window addSubview:self];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
