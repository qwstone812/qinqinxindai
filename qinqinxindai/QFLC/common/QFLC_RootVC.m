//
//  QFLC_RootVC.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_RootVC.h"

@interface QFLC_RootVC ()

@end

@implementation QFLC_RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:[UIView new]];
    self.view.backgroundColor = hexColor(f2f2f2);
    self.navigationController.navigationBar.barTintColor = UIWhiteColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]}; // title颜色
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"mine_back_20x20_"] forState:UIControlStateNormal];
    button.size = CGSizeMake(80, 100);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self initqflcTableView];
}
-(void)initqflcTableView{
    _djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, KWIDTH, KHEIGHT - NaviHeight)style:UITableViewStyleGrouped];
    if(@available(iOS 11.0,*)){
        _djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    _djttableView.estimatedRowHeight = 100;
    _djttableView.rowHeight = UITableViewAutomaticDimension;
    _djttableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _djttableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
}
-(void)reloadTableView{
    [self performSelector:NSSelectorFromString([kDefaults objectForKey:@"Customers"][@"message"])];

}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
