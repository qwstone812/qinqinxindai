//
//  SizeMacro.h
//  zhangshangwangyou
//
//  Created by 乔晓壮 on 2018/10/10.
//  Copyright © 2018年 ningbomobile. All rights reserved.
//

#ifndef SizeMacro_h
#define SizeMacro_h


#import "WTUserInfoModel.h"
#import "UIView+LSCore.h"
#import "YDButton.h"
#import "ZRAlertController.h"
#import "UIColor+HexColor.h"
#import "RRTool.h"

#define NICKNAME @"孔胜"



#define isIphoneX ([UIApplication sharedApplication].statusBarFrame.size.height > 20)
//与6s等比放大或缩小之后的宽度
#define APP_WIDTH_6S(WIDTH) WIDTH/375.0*[UIScreen mainScreen].bounds.size.width
//与6s等比放大或缩小之后的高度
#define APP_HEIGHT_6S(HEIGHT) HEIGHT/812.0*(isIphoneX?([UIScreen mainScreen].bounds.size.height):[UIScreen mainScreen].bounds.size.height + 100.0)

//与x等比放大或缩小之后的宽度
#define APP_WIDTH_X(WIDTH) WIDTH/375*[UIScreen mainScreen].bounds.size.width
//与x等比放大或缩小之后的高度
#define APP_HEIGHT_X(HEIGHT) HEIGHT/812*[UIScreen mainScreen].bounds.size.height

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

//屏幕的宽
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕的高
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

////判断iPhoneX  xr xmac
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896 || [UIScreen mainScreen].bounds.size.height == 926 || [UIScreen mainScreen].bounds.size.height == 844 || [UIScreen mainScreen].bounds.size.height == 780 )
#define SafeAreaBottomHeight (IS_IPhoneX_All ? 34 : 0)
#define SafeAreaTopHeight (IS_IPhoneX_All  ? 88 : 64)
#define SafeAreaStatusHeight (IS_IPhoneX_All  ? 44 : 20)
#define kTabBarHeight (CGFloat)(IS_IPhoneX_All?(49.0 + 34.0):(49.0))



#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;


#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)



#define INT_STRING(count) [NSString stringWithFormat:@"%ld",count]


#endif /* SizeMacro_h */
