//
//  QFLC_Login2VC.m
//  qinqinxindai
//
//  Created by zrmac on 18.1.21.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "QFLC_Login2VC.h"
//#import "XXMMProtocalVC.h"
//#import "VerifyView.h"
#import "UILabel+YBAttributeTextTapAction.h"
//#import "JPUSHService.h"
#import "DWOtherDetailVC.h"
#import <sys/utsname.h>
#import "VerifyView.h"
#import "JCAlertView.h"
@interface QFLC_Login2VC ()
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

@implementation QFLC_Login2VC
{
    NSString* _code;//短信验证码
    NSInteger _sceonds;//倒计时时间
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (IBAction)tuichu:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _isAgree = NO;

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
//                XXMMProtocalVC * target = [[XXMMProtocalVC alloc]init];
//                       NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Register" ofType:@"html"]];
//                       target.str  =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                __push(target);
                NSString * url = [NSString stringWithFormat:@"http://protocol.jibentec.cn/%@_%@.html",messageName,index?@"private":@"register"];
                DWOtherDetailVC * target = [[DWOtherDetailVC alloc]init];
                target.url = url;
                target.titleProductStr = @"协议";
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
- (IBAction)xieyiAction:(UIButton *)sender {
    _isAgree = !_isAgree;
    [sender setImage:[UIImage imageNamed:_isAgree ? @"Yes":@"No"] forState:UIControlStateNormal];
}
- (IBAction)okAction:(id)sender {
    if ([Utilities isMobileNumber:self.phoneTF.text] && self.codeTF.text.length > 0) {
        [self loginNetLoad];
    }else{
        [self.view makeToast:@"手机号或验证码错误"];
    }
}
- (IBAction)codeAction:(id)sender {
    
    if ([Utilities isMobileNumber:self.phoneTF.text]) {
//        [self tipUI];
        [self showTipView];

//        [self loadDataGetCode];
    }else{
        [self.view makeToast:@"请输入正确手机号"];
    }
}
-(void)showTipView{
    [self.view endEditing:YES];
     _tipView = [[VerifyView alloc]init];
    _tipView.frame = CGRectMake(0, 0, 300, 200);
        _alertView = [[JCAlertView alloc]initWithCustomView:_tipView dismissWhenTouchedBackground:YES];
        __weak typeof(self) weakSelf = self;
        _tipView.VerifyBlock = ^{
            [weakSelf.alertView dismissWithCompletion:^{
                
            }];
            [weakSelf loadDataGetCode];
        };
        _tipView.CancelBlock = ^{
            [weakSelf.alertView dismissWithCompletion:^{

            }];
        };
        [_alertView show];
}
-(void)tapActionClicked:(UITapGestureRecognizer*)tap{
    _coverView.hidden = YES;
//    [_tipView removeFromSuperview];
}
#pragma mark - 弹出框
-(void)tipUI{
    _coverView.hidden = NO;
    

}
#pragma mark - 登录接口
-(void)loginNetLoad{
    if (!_isAgree) {
           [self.view makeToast:@"请先同意注册服务协议和隐私协议"];
           return;
       }
       NSString * phone = self.phoneTF.text;
       if([testPhones containsObject:phone]){
           [Utilities delay:0.5 view:self.view action:^{
               [self.view makeToast:@"服务器错误，请稍后再试"];
           }];
       }else{
           
           
           NSString *deviceName = [[QQXDManager shareInstance] deviceModelName];
           NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
           NSString *deviceID = [RRTool getUUID];
           NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
           CFShow((__bridge CFTypeRef)(infoDictionary));
           NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];

           NSDictionary *parm = @{ @"userphone": self.phoneTF.text, @"code": self.codeTF.text, @"terminal": @"2", @"channel_nid": Header_channel, @"mobile_id": deviceID, @"version": @"3.9.1", @"device_model": deviceName, @"device_version": sysVersion };
           
        
           [MBProgressHUD showHUDAddedTo:self.view animated:YES];
           
           
           [QFLCNetManager qflcPostRequsetWithUrl:DCnewCheckCode_Url Paramater:parm SuccessBlock:^(id responseObject) {
               NSDictionary* result = (NSDictionary*)responseObject;
               NSInteger error_code = [result[@"error_code"] integerValue];
               if (error_code == 0) {
                   [kDefaults setObject:responseObject[@"data"] forKey:DaichaoUserInfoKey];
                   [kDefaults synchronize];
                   [self .navigationController dismissViewControllerAnimated:YES completion:^{
                       
                   }];
               }else{
                   NSString* msg = result[@"error_message"];
                   [self.view makeToast:msg];
               }
               [MBProgressHUD hideHUDForView:self.view animated:YES];
           } FailBlock:^(NSError *error) {
               [MBProgressHUD hideHUDForView:self.view animated:YES];
           }];
       }
}

#pragma mark - 获取验证码
-(void)loadDataGetCode{
    NSDictionary *dict = @{ @"userphone": self.phoneTF.text };
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [QFLCNetManager qflcPostRequsetWithUrl:DCGetCode_Url Paramater:dict SuccessBlock:^(id responseObject) {
        
        NSDictionary* result = (NSDictionary*)responseObject;
        
        NSInteger error_code = [result[@"error_code"] integerValue];
        if (error_code == 0) {
            [self.codeTF becomeFirstResponder];
            [self addTimerIfNone];
            NSString* msg = result[@"data"][@"msg"];
            [self.view makeToast:msg];
        }else{
            NSString* msg = result[@"error_message"];
            [Utilities alertWithTitle:@"提示" message:msg ConfirmTitle:@"确定" cancelTitle:nil controller:self Confirm:^{
                
            } cancelAction:^{
                
            }];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } FailBlock:^(NSError *error) {
        [self.view makeToast:@"获取验证码失败，请检查手机号是否正确"];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (IBAction)tiyanyixia:(id)sender {

}
#pragma mark - 倒计时
-(void)addTimerIfNone{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
}
-(void)timerFireMethod:(NSTimer *)theTimer{
    
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

- (void)releaseTImer {
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
    
    [self releaseTImer];
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
