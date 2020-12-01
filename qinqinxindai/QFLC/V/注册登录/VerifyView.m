//
//  VerifyView.m
//  xindaiyuan
//
//  Created by 李晨 on 2018/9/13.
//  Copyright © 2018年 jituan. All rights reserved.
//

#import "VerifyView.h"
#import "VerifyNumberView.h"
@interface VerifyView ()
@property(nonatomic,strong)VerifyNumberView* codeView;

@property(nonatomic,strong)UITextField* codeTF;

@property(nonatomic,strong)UIButton* okButton;
@end
@implementation VerifyView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        ViewForBorderRadius(self, 5, 0, UIClearColor);
        [self addUI];
    }
    return self;
}
-(void)okButtonClicked:(UIButton*)sender{
    if (self.codeTF.text.integerValue == self.codeView.result) {
        if (self.VerifyBlock) {
            self.VerifyBlock();
        }
        [self removeFromSuperview];
    }else{
        [self makeToast:@"您算错了！"];
    }
}

-(void)addUI{
    UILabel * label = [[UILabel alloc]init];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.top.equalTo(self).offset(31.5);
        make.width.equalTo(self);
        make.height.equalTo(@15.5);
    }];
    label.font = appMFont(15);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"输入图形验证码";
    UIView * secondView = [[UIView alloc]init];
    secondView.backgroundColor = hexColor(FAFAFA);
    [self addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15.5);
        make.right.equalTo(self).offset(-15.5);
        make.top.mas_equalTo(label.mas_bottom).offset(17);
        make.height.equalTo(@45);
    }];
    ViewForBorderRadius(secondView, 1, 0, UIClearColor);

    _codeView = [[VerifyNumberView alloc]init];
    [secondView addSubview:_codeView];
    
    _codeTF = [[UITextField alloc]init];
    _codeTF.placeholder = @"请输入计算结果";
    _codeTF.textAlignment = NSTextAlignmentCenter;
    _codeTF.layer.borderWidth = 0.5;
    _codeTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _codeTF.keyboardType = UIKeyboardTypeNumberPad;
    ViewForBorderRadius(_codeTF, 3, 0, UIClearColor);
//    _codeTF.backgroundColor = hexColor(FAFAFA);
    [secondView addSubview:_codeTF];
    
    _okButton = [[UIButton alloc]init];
    _okButton.layer.cornerRadius = 19.5;
    _okButton.layer.masksToBounds = YES;
    [_okButton setBackgroundColor:ThemeColor];
    [_okButton setTitle:@"确认" forState:UIControlStateNormal];
    _okButton.titleLabel.font = appMFont(15);
    [_okButton addTarget:self action:@selector(okButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_okButton];
    
    //==========mas
    
    [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secondView);
        make.top.equalTo(secondView);
        make.height.equalTo(@45);
        make.width.equalTo(@149);
    }];
    [_codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_codeTF);
        make.left.mas_equalTo(_codeTF.mas_right);
        make.width.equalTo(@120);
        make.height.equalTo(@45);
    }];
    [_okButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.right.equalTo(self).offset(-15);
        make.width.equalTo(@123);
        make.height.equalTo(@39);
    }];
    
    UIButton * cancelBtn = [[UIButton alloc]init];
    cancelBtn.layer.cornerRadius = 19.5;
    cancelBtn.layer.masksToBounds = YES;
//    [cancelBtn setBackgroundColor:hexColor(999999)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
     [cancelBtn setTitleColor:hexColor(999999) forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = appMFont(15);
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    ViewForBorderRadius(cancelBtn, 19.5, 0.5, hexColor(bbbbbb));
    [self addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(@123);
        make.height.equalTo(@39);
    }];
}
-(void)cancelBtnClick:(UIButton *)sender{
    if (_CancelBlock) {
         [self removeFromSuperview];
        _CancelBlock();
    }
}
@end
