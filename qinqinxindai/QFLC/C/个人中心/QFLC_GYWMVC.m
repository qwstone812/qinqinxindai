//
//  QFLC_GYWMVC.m
//  qinqinxindai
//
//  Created by zrmac on 1.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_GYWMVC.h"

@interface QFLC_GYWMVC ()

@end

@implementation QFLC_GYWMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    UIImageView * logoImageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"qqxd_icon"]];
    logoImageView.frame = CGRectMake(0, NaviHeight + 80, 80, 80);
    logoImageView.centerX = KWIDTH / 2;
    [self.view addSubview:logoImageView];
    UILabel * label = [DSNTool LabelWithFrame:CGRectMake(0, logoImageView.bottom + 15, KWIDTH, 20) Font:appMFont(18) TextColor:UIBlackColor TextPosin:NSTextAlignmentCenter BackgourndColor:UIClearColor text:@"亲亲信贷"];
    [self.view addSubview:label];
    
    UILabel * titleL = [DSNTool LabelWithFrame:CGRectMake(15, label.bottom + 20, KWIDTH - 30, 50) Font:appFont(16) TextColor:UIBlackColor TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"亲亲信贷，专门为信货经理，信货员打造的一款移动获客展业平台，助力快速开单!"];
    titleL.numberOfLines = 0;
    [self.view addSubview:titleL];
    
    
    
    UILabel * stateLab = [DSNTool LabelWithFrame:CGRectMake(15, titleL.bottom + 20, KWIDTH - 30, 30) Font:appFont(20) TextColor:UIBlackColor TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"【亲亲信贷声明】"];
    [self.view addSubview:stateLab];
    
    
    UILabel * questionL = [DSNTool LabelWithFrame:CGRectMake(15, stateLab.bottom + 10, KWIDTH - 30, 20) Font:[UIFont boldSystemFontOfSize:16] TextColor:hexColor(ad4132) TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"1、我们的软件是用来干什么的？谁可以使用？"];
    [self.view addSubview:questionL];
    
    UILabel * answerLab1 = [DSNTool LabelWithFrame:CGRectMake(15, questionL.bottom , KWIDTH - 30, 110) Font:appFont(15) TextColor:hexColor(333333) TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"我们面向全国范围内的信贷客户经理，通过手机验证码的方式注册并登录亲亲信贷App。信贷客户经理可以使用亲亲信贷App寻找适合自己的客户，同时我们准备了很多信贷知识进行分享学习，可以提高信贷员的业务水平。"];
    answerLab1.numberOfLines = 0;
    [self.view addSubview:answerLab1];
    
    
    UILabel * questionL2 = [DSNTool LabelWithFrame:CGRectMake(15, answerLab1.bottom + 10, KWIDTH - 30, 20) Font:[UIFont boldSystemFontOfSize:16] TextColor:hexColor(ad4132) TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"2、费用收取说明"];
    [self.view addSubview:questionL2];
    
    UILabel * answerLab2 = [DSNTool LabelWithFrame:CGRectMake(15, questionL2.bottom , KWIDTH - 30, 90) Font:appFont(15) TextColor:hexColor(333333) TextPosin:NSTextAlignmentLeft BackgourndColor:UIClearColor text:@"抢单大厅需要使用亲亲币进行抢单，也可使用会员进行免费抢单。亲亲币和会员可在个人中心进行充值购买，会员权益说明请到首页“会员权益”进行查看"];
    answerLab2.numberOfLines = 0;
    [self.view addSubview:answerLab2];
    
    
    
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
