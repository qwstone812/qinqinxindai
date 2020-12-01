//
//  QFLC_RenZhengVC.m
//  qinqinxindai
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_RenZhengVC.h"

@interface QFLC_RenZhengVC ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation QFLC_RenZhengVC
-(void)tapAction{
    [Utilities delay:0.3 view:self.view action:^{
        [self.view makeToast:@"您已完成认证，如需更改，请联系客服"];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资质认证";
    self.view.backgroundColor = UIWhiteColor;
    [self.btn addTarget:self action:@selector(tapAction)];
    [self.view addTarget:self action:@selector(tapAction)];
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
