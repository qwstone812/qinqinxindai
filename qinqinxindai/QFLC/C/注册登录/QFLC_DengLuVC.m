//
//  QFLC_DengLuVC.m
//  qinqinxindai
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_DengLuVC.h"
#import "UILabel+YBAttributeTextTapAction.h"
//#import "JPUSHService.h"
#import <sys/utsname.h>
#import "VerifyView.h"
#import "JCAlertView.h"
#import "QFLC_XieyiVC.h"
@interface QFLC_DengLuVC ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *protocolL;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property(nonatomic,strong)NSTimer* timer;//倒计时
@property(nonatomic,strong)VerifyView* tipView;//计算几加几
@property(nonatomic,strong)UIView* coverView;//蒙版
@property(nonatomic,strong)NSDictionary * productDic;
@property (weak, nonatomic) IBOutlet UIButton *tuichuBtn;
@property (nonatomic,strong)JCAlertView *alertView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
//@property(nonatomic,strong)UserModel * userModel;
@property (weak, nonatomic) IBOutlet UIButton *xieyiBtn;
//@property(nonatomic,strong)UIView* coverView;//蒙版
@property(nonatomic,assign)BOOL isAgree;
@end

@implementation QFLC_DengLuVC
{
    NSString* _code;//短信验证码
    NSInteger _sceonds;//倒计时时间
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (IBAction)qqxdtuichu:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIWhiteColor;
    _isAgree = YES;

    ViewForBorderRadius(_logoImageView, 8, 0, UIClearColor);
    for (UIView * subView in self.view.subviews) {
        subView.alpha =  0;
    }
    [UIView animateWithDuration:1 animations:^{
        for (UIView * subView in self.view.subviews) {
            subView.alpha =  1;
        }
    }];
    self.fromType = [kDefaults objectForKey:@"fromType"];
//    if ([self.fromType isEqualToString:@"A"]) {
//        self.tuichuBtn.hidden = NO;
//    }else if ([self.fromType isEqualToString:@"B"]){
//        self.tuichuBtn.hidden = YES;
//    }
//    self.tuichuBtn.hidden = YES;

    ViewForBorderRadius(_codeBtn, 5, 1, ThemeColor);
    [_codeBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
    _sceonds = 60;

    _btn.backgroundColor = ThemeColor;
    _btn.layer.cornerRadius = 5;
    _btn.layer.masksToBounds = YES;
    NSMutableAttributedString * attr = [[NSMutableAttributedString alloc]initWithString:@"请同意"];
            
            [attr appendAttributedString:[[NSAttributedString alloc]initWithString:@"《注册服务协议》" attributes:@{NSForegroundColorAttributeName : hexColor(1598F6)}]];
            [attr appendAttributedString:[[NSAttributedString alloc]initWithString:@"和"]];
            [attr appendAttributedString:[[NSAttributedString alloc]initWithString:@"《隐私协议》" attributes:@{NSForegroundColorAttributeName : hexColor(1598F6)}]];
            _protocolL.attributedText = attr;
            _protocolL.enabledTapEffect = NO;
            [_protocolL yb_addAttributeTapActionWithStrings:@[@"《注册服务协议》",@"《隐私协议》"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
               
                
   
                QFLC_XieyiVC * target = [[QFLC_XieyiVC alloc]init];
                target.url = @"http://qqxd.sylctec.cn/private.html";
                target.titleStr = @"隐私注册协议";
                __push(target);
             
            }];
    _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, NaviHeight, KWIDTH, KHEIGHT-NaviHeight)];
    _coverView.backgroundColor = [UIColor blackColor];
    _coverView.alpha = 0.1;
    _coverView.hidden = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapActionClicked:)];
    [_coverView addGestureRecognizer:tap];
    [self.view addSubview:_coverView];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)qqxdokAction:(id)sender {
    if ([Utilities isMobileNumber:self.phoneTF.text] && self.codeTF.text.length > 0) {
        [self qqxdloginNetLoad];
    }else{
        [self.view makeToast:@"手机号或验证码错误"];
    }
}
- (IBAction)qqxdcodeAction:(id)sender {
    
    if ([Utilities isMobileNumber:self.phoneTF.text]) {
//        [self tipUI];
        [self qqxdshowTipView];

//        [self loadDataGetCode];
    }else{
        [self.view makeToast:@"请输入正确手机号"];
    }
}
-(void)qqxdshowTipView{
    [self.view endEditing:YES];
     _tipView = [[VerifyView alloc]init];
    _tipView.frame = CGRectMake(0, 0, 300, 200);
        _alertView = [[JCAlertView alloc]initWithCustomView:_tipView dismissWhenTouchedBackground:YES];
        __weak typeof(self) weakSelf = self;
        _tipView.VerifyBlock = ^{
            [weakSelf.alertView dismissWithCompletion:^{
                
            }];
            [weakSelf qqxdloadDataGetCode];
        };
        _tipView.CancelBlock = ^{
            [weakSelf.alertView dismissWithCompletion:^{

            }];
        };
        [_alertView show];
}
-(void)qqxdtapActionClicked:(UITapGestureRecognizer*)tap{
    _coverView.hidden = YES;
}
#pragma mark - 弹出框
-(void)qqxdtipUI{
    _coverView.hidden = NO;
    

}
#pragma mark - 登录接口
-(void)qqxdloginNetLoad{
    if (!_isAgree) {
        [self.view makeToast:@"请先同意注册服务协议和隐私协议"];
        return;
    }
    NSString * phone = self.phoneTF.text;
    if([testPhones containsObject:phone]){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NSDictionary * dic = @{
                        @"nickname" : @"孔胜",
                        @"token" : @"f1a690b3dcc3b6c1951ae5924674d8f5",
                        @"userphone" : @"13974657364"
                    };
                    [kDefaults setObject:dic forKey:DaichaoUserInfoKey];
                    [kDefaults synchronize];
                    [self.navigationController dismissViewControllerAnimated:YES completion:^{
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"tableViewReload" object:nil];
                    }];
                    
                    
                   
                    
                    
        //             [Utilities appDelegate].window.rootViewController = [Utilities appDelegate].tabbar;
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                });
    }else{
        
        [Utilities delay:0.5 view:self.view action:^{
            [self.view makeToast:@"请输入正确验证码"];
        }];
    }
}

#pragma mark - 获取验证码
-(void)qqxdloadDataGetCode{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self qqxdaddTimerIfNone];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
    return;
}


#pragma mark - 倒计时
-(void)qqxdaddTimerIfNone{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(qqxdtimerFireMethod:) userInfo:nil repeats:YES];
    
}
-(void)qqxdtimerFireMethod:(NSTimer *)theTimer{
    
    if (_sceonds == 1) {
        [_timer invalidate];
        _sceonds = 60;
        [_codeBtn setTitle:@"获取验证码" forState: UIControlStateNormal];
        [_codeBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [_codeBtn setEnabled:YES];
    }else{
        _sceonds--;
        NSString *title = [NSString stringWithFormat:@"%lds",_sceonds];
        [_codeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_codeBtn setEnabled:NO];
        [_codeBtn setTitle:title forState:UIControlStateNormal];
    }
}

- (void)qqxdreleaseTImer {
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)]) {
            if ([_timer isValid]) {
                [_timer invalidate];
                _sceonds = 60;
            }
        }
    }
}
-(void)dealloc{
    
    [self qqxdreleaseTImer];
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
