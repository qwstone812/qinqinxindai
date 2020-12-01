//
//  QFLC_ForumVC.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ForumVC.h"
#import "QFLC_ForumCell.h"
#import "QFLC_ForumDetail.h"
@interface QFLC_ForumVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray       *titleArray;
@property (nonatomic, strong) NSArray       *iconArray;

@end

@implementation QFLC_ForumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"学习文章";
    self.navigationItem.leftBarButtonItem = nil;

    [self qflc_init];
}

- (void)qflc_init{
    
    self.titleArray = @[@"信贷员培训心得篇1",@"信贷员培训心得篇2",@"信贷员培训心得篇3",@"月薪上万的信贷经理，和你有什么不同",@"有没有维护客户的好法子？必须有！",@"学会这5条，想干不好贷款都难！"];
    self.iconArray = @[@"xinde1",@"xinde2",@"xinde3",@"xinde4",@"xinde5",@"xinde6"];
    self.djttableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviHeight, KWIDTH, KHEIGHT - TabbarHeight - NaviHeight) style:1];
        self.djttableView.delegate = self;
        self.djttableView.dataSource = self;
        [self.view addSubview:self.djttableView];
        if(@available(iOS 11.0,*)){
            self.djttableView.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets=NO;
        }
        self.djttableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titleArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return APP_HEIGHT_6S(230.0);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
   
    QFLC_ForumCell * cell = [tableView dequeueReusableCellWithIdentifier:@"QFLC_ForumCell"];
    if (!cell) {
        cell = [[QFLC_ForumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QFLC_ForumCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    cell.titleLabel.text = self.titleArray[indexPath.row];
    cell.matchIcon.image = Img(self.iconArray[indexPath.row]);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",self.titleArray[indexPath.row]);
    QFLC_ForumDetail * target = [[QFLC_ForumDetail alloc]init];
    target.hidesBottomBarWhenPushed = YES;
    target.qflc_title = self.titleArray[indexPath.row];
    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:self.iconArray[indexPath.row] ofType:@"html"]];
    target.content  =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    __push(target);
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
