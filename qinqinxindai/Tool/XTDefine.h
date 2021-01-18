//
//  XTDefine.h
//  XunTa
//
//  Created by 张杰 on 2019/10/23.
//  Copyright © 2019 GodZhan9Daniel. All rights reserved.
//

#ifndef XTDefine_h
#define XTDefine_h
#define ManageObject [Utilities appDelegate].persistentContainer.viewContext

#define kDefaults [NSUserDefaults standardUserDefaults]
#define isHaveShowYinSi @"isHaveShowYinSi"
#define DaichaoUserInfoKey @"DaichaoUserInfo"
#define DaichaoToken [[kDefaults objectForKey:DaichaoUserInfoKey]objectForKey:@"token"]
#define Phone [[kDefaults objectForKey:DaichaoUserInfoKey]objectForKey:@"token"]

#define BDAndJGToUserInfoKey @"XTBDANDJGUserInfo"
#define BDAndJGToToken [[kDefaults objectForKey:BDAndJGToUserInfoKey]objectForKey:@"identity"]

//#define ISVIP [[kDefaults objectForKey:BDAndJGToUserInfoKey]objectForKey:@"vip"]

//#define ISVIP [kDefaults objectForKey:BDAndJGToUserInfoKey]
#define kVipKey @"kVipKey"
#define ISVIP  [kDefaults objectForKey:kVipKey]
//#define ISVIP @"YES"


#define BaseConfigUserInfoKey @"BaseConfigUserInfo"
#define BasePpload_domain [[kDefaults objectForKey:BaseConfigUserInfoKey]objectForKey:@"upload_domain"] // 上传域名


//#define DaichaoToken @"101850566a61e92da06210c1760100ab"
#define WDUserInfoKey @"WDUserInfo"
#define WDToken [[kDefaults objectForKey:WDUserInfoKey]objectForKey:@"token"]
//适配
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height
//类

//颜色
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];
//屏幕宽高...
#define KScreenWidth    [UIScreen mainScreen].bounds.size.width
#define KScreenHeight    [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
//iPhone X
#define DEVICE_IS_IPHONEX (((KScreenWidth == 375.f && KScreenHeight == 812.f) || (KScreenWidth == 414.f && KScreenHeight == 896.f)  || [UIScreen mainScreen].bounds.size.height == 926 || [UIScreen mainScreen].bounds.size.height == 844 || [UIScreen mainScreen].bounds.size.height == 780) ? YES : NO)
// Statusbar && navigationbar height.
#define  NaviHeight  (DEVICE_IS_IPHONEX ? 88.f : 64.f)
// Tabbar height.
#define  TabbarHeight              (DEVICE_IS_IPHONEX ? (49.f+34.f) : 49.f)//颜色
#define  StatusBarHeight              (DEVICE_IS_IPHONEX ? (44) : 20)//颜色

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define appFont(size) [Utilities getFontWithSize:(size)]
#define appMFont(size) [Utilities getMedumFontWithSize:(size)]
//特用颜色
//#define ThemeColor RGBCOLOR(50, 120, 253)
//#define ThemeColor [UIColor colorWithRed:0.99 green:0.64 blue:0.1 alpha:1]
#define ThemeColor hexColor(02A2F8)

// 字体颜色
#define DCTitleColoc [UIColor colorWithRed:1 green:0.68 blue:0.07 alpha:1]
#define __pushWithClassName(name) UIViewController * target = [[NSClassFromString(name) alloc]init];\
target.hidesBottomBarWhenPushed = YES;\
[self.navigationController pushViewController:target animated:YES];
#define NewTextColor [UIColor colorWithRed:0.92 green:0.69 blue:0.53 alpha:1]
#define NewDCThemeColor [UIColor colorWithRed:1 green:0.3 blue:0 alpha:1]
//#define NewDCThemeColor [UIColor colorWithRed:1 green:0.3 blue:0 alpha:1]
#define DCThemeColor [UIColor colorWithRed:1 green:0.22 blue:0.02 alpha:1]
#define BlueColor [UIColor colorWithRed:0 green:0.63 blue:0.91 alpha:1]
#define REDCOLOR [UIColor colorWithRed:251/255.0 green:86/255.0 blue:42/255.0 alpha:1.0]
#define TextGrayColor RGBCOLOR(51, 51, 51)
#define TextLightGrayColor [UIColor colorWithRed:0.56 green:0.56 blue:0.56 alpha:1]

#define APPNAME @"亲亲信贷iOS"
#define DCCHANNEL @"ios-daixiaobao-01"
#define messageName @"daixiaobao"
#define KVERSION [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"]

// ---------------------- 公共参数 -------------------------
#define APPYQM @"xuntaapp2019"


#define kRandomColor  [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0]
#define configdic [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"]]
#define configkey ([[kDefaults objectForKey:@"kStatus"]isEqualToString:@"1"]?@"dc":@"dk")
#define kRandomFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]
#define __cgr(x, y, width, height)  CGRectMake((x), (y), (width), (height))
#define cgr(x, y, width, height)    __cgr((x), (y), (width), (height))
// View 圆角
#define UDOnlyViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]
//#define TabbarItems [configdic objectForKey:configkey]

///新版橙色
#define NEWOrangeColor UIColorFromRGB(0xFD6956)

#define NewTitleColor [UIColor colorWithRed:1 green:0.28 blue:0.01 alpha:1]


/// 蓝色
#define DRblueColor UIColorFromRGB(0x1687fb)

/// 蓝色背景
#define DRblueBGColor UIColorFromRGB(0xf0f7ff)
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/*设置图片*/
#define Img(a) [UIImage imageNamed:a]
/*黑简细*/
#define HJX(a)  [UIFont fontWithName:@"STHeitiSC-light" size:a]

/*字体*/
#define DQBoldBlack(a) [UIFont fontWithName:@"FZZhengHeiS-EB-GB" size:a]

/*系统默认*/
#define sys(a) [UIFont systemFontOfSize:a];
///*适配系统字体*/
//#define adjustFont(a) [MBFontAdapter adjustFont:[UIFont systemFontOfSize:a]]
///*适配系统粗字体*/
//#define adjustBoldFont(a) [MBFontAdapter adjustFont:[UIFont boldSystemFontOfSize:a]]
///*适配-黑简细-字体*/
//#define adjustHJX(a) [MBFontAdapter adjustFont:[UIFont fontWithName:@"STHeitiSC-light" size:a]]
//
///*适配自由字体*/
//#define adaptFont(a,b,c) [MBFontAdapter adjustFont_5:[UIFont systemFontOfSize:a] adjustFont_6:[UIFont systemFontOfSize:b] adjustFont_6p:[UIFont systemFontOfSize:c]]
//
///*适配自由字体粗体*/
//#define adaptBoldFont(a,b,c) [MBFontAdapter adjustFont_5:[UIFont boldSystemFontOfSize:a] adjustFont_6:[UIFont boldSystemFontOfSize:b] adjustFont_6p:[UIFont boldSystemFontOfSize:c]]

///*适配ttf字体*/
//#define AdaptDQBoldFont(a,b,c)  [MBFontAdapter adjustFont_5:[UIFont fontWithName:@"FZZhengHeiS-EB-GB" size:a] adjustFont_6[UIFont fontWithName:@"FZZhengHeiS-EB-GB" size:b] adjustFont_6p[UIFont fontWithName:@"FZZhengHeiS-EB-GB" size:c]]

/*系统默认加粗*/
#define Boldsys(a) [UIFont boldSystemFontOfSize:a];
//灰字颜色
#define Gracolor [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1]
//红字颜色
#define redColo [UIColor colorWithRed:205/255.0 green:80/255.0 blue:73/255.0 alpha:1]
#define riskColor UIColorFromRGB(0x2b2b2b)
#define riskFont adaptFont(11, 12, 13)

//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
#define UIClearColor        [UIColor clearColor]
#define UIRedColor          [UIColor redColor]
#define UIGreenColor        [UIColor greenColor]
#define UIBlueColor         [UIColor blueColor]
#define UIGrayColor         [UIColor grayColor]
#define UIBlackColor        [UIColor blackColor]
#define UIDarkGrayColor     [UIColor darkGrayColor]
#define UILightGrayColor    [UIColor lightGrayColor]
#define UIWhiteColor        [UIColor whiteColor]

// view controller
#define __push(vc)          [self.navigationController pushViewController:(vc) animated:YES]
#define __pop()             [self.navigationController popViewControllerAnimated:YES]
#define __popTo(vc)         [self.navigationController popToViewController:(vc) animated:YES]
#define __popToRoot()       [self.navigationController popToRootViewControllerAnimated:YES]

#define _btnAction(btn,sel) [btn addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside]
/// 辅助文字颜色
#define UIColorAuxiliaryTitle UIColorFromRGB(0x7B7D89)

///浅背景颜色
#define UIColorLight UIColorFromRGB(0xf3f3f3)

/// 突出黄颜色
#define UIColorOrange UIColorFromRGB(0xFF7f34)

/// 分割线颜色
#define UIColorLine UIColorFromRGB(0xCCD6DC)

//新版黑色
#define NEWBLACKCOLOR rgba(34, 34, 34, 1.0)

//新版蓝色
#define NEWbluecolor UIColorFromRGB(0x47a8ef)

//按钮正常蓝色
#define BTNBG_normalColor UIColorFromRGB(0x4cacf0)

//按钮点击颜色
#define BTNBG_highlightedColor UIColorFromRGB(0x349ae2)

//按钮不可点击颜色
#define BTNBG_unclickColor UIColorFromRGB(0xd6dde2)


/////新版color/////////////
/// 主标题文字
#define NEWColorTitle UIColorFromRGB(0x2B2B2B)

/// 副标题类文字
#define NEWColorSubTitle UIColorFromRGB(0x848993)

///新版橙色
#define NEWOrangeColor UIColorFromRGB(0xFD6956)


/// 蓝色
#define DRblueColor UIColorFromRGB(0x1687fb)

/// 蓝色背景
#define DRblueBGColor UIColorFromRGB(0xf0f7ff)


/// Placehoder 颜色
#define PlacehoderColor UIColorFromRGB(0x78858E)




//橙红背景
#define NEW_BGCOLOR UIColorFromRGB(0xfff2ee)
// View 圆角和加边框
#define UDViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
// View 圆角和加边框
#define ViewForBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define UDOnlyViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]
// 字符串拼接
#define __format_string(format, ...)        [NSString stringWithFormat:format, __VA_ARGS__]
#define NSStringWithFormat(format, ...)     [NSString stringWithFormat:format, __VA_ARGS__]

#define StringFormat(a) [NSString stringWithFormat:@"%@",a]
// 判断字符串为空
#define IsNULLString(string) ((![string isKindOfClass:[NSString class]]) || [string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"])
#define VERSIONApp @"6.1.0"
// 本地存储
#define __user_default          [NSUserDefaults standardUserDefaults]
#define USER_DEFAULT            __user_default
#define kDeviceSystemVersion            ([UIDevice currentDevice].systemVersion.floatValue)
#define IS_IOS_11  [[[UIDevice currentDevice]systemVersion]floatValue]>=11.0

#define IS_IOS_8  [[[UIDevice currentDevice]systemVersion]floatValue]>=8.0
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f

#define Hlweak(weakSelf)    __weak __typeof(&*self) weakSelf = self

/*适配 5, 6, 6p上数值*/
//#define mySize(a,b,c) [Configuration adjustScreensize:a iphone6:b iphone6p:c]

/*适配 4, 5, 6, 6p上数值*/
//#define mySizeTwo(a,b,c,d) [Configuration adjustScreensizeWithIphoneP4:a iphone5:b  iphone6:c iphoneSp:d]

/*适配 4, 5, 6, 6p, iphoneX上数值*/
//#define mySizeThree(a,b,c,d,e) [Configuration adjustScreensizeWithIphoneP4:a iphone5:b  iphone6:c iphoneSp:d iphoneX:e]

/*适配iOS11,其他系统*/
//#define mySystemVersion(a,b) [Configuration systemVersion_11:a otherVersion:b]
//屏幕比例
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kWidthScale    [[UIScreen mainScreen] bounds].size.width/320
#define kHeightScale   [[UIScreen mainScreen] bounds].size.height/568

#define kWidth6Scale    [[UIScreen mainScreen] bounds].size.width/375
#define kHeight6Scale   [[UIScreen mainScreen] bounds].size.height/667
// 三木运算
#define defaultObject(valueA,valueB,defaultValue)  ((valueA)?(valueB):(defaultValue))
#define NavigationTitleFont self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: NEWColorTitle,NSFontAttributeName :[UIFont systemFontOfSize:18]}

#define testPhones @[@"15810695411"]


//使用安心花接口
//  --------------------- header参数 ------------------------
#define Header_channel @"ios-anxinhua"
#define Header_name @"axh"
// 登录注册
#define DCSERVERLogin_URL @"https://api.ayxloan.com/v1"
#define DCSERVER_URL @"https://api.ayxloan.com/v3"

// 获取验证码
#define DCGetCode_Url [DCSERVERLogin_URL stringByAppendingString:@"/sms/getcode"]
#define DCnewCheckCode_Url [DCSERVERLogin_URL stringByAppendingString:@"/sms/newCheckCode"]
#define DCnewCheckCodeTest_Url [DCSERVERLogin_URL stringByAppendingString:@"/sms/newCheckCodeTest"]
// loanList
#define DCLoanList_Url [DCSERVER_URL stringByAppendingString:@"/loan/productlist"]





#define DaichaoPhone [[kDefaults objectForKey:DaichaoUserInfoKey]objectForKey:@"userphone"]


#define SERVER_URL [NSString stringWithFormat:@"%@/v2/vest",[ZYNetManager shareManager].currentServeUrl]

#define SERVER_URL2 [NSString stringWithFormat:@"%@/v1/sms",[ZYNetManager shareManager].currentServeUrl]

#define GetGoodsListUrl [SERVER_URL stringByAppendingString:@"/getGoodsList"]
#define ApplyUrl [SERVER_URL stringByAppendingString:@"/apply"]
#define GetCodeUrl [SERVER_URL2 stringByAppendingString:@"/getcode"]
#define getNewCodeUrl [NSString stringWithFormat:@"%@/v3/sms/getcode",[QQXDManager shareManager].currentServeUrl]

#define CheckCodeUrl [SERVER_URL2 stringByAppendingString:@"/checkCode"]
#define OldUserLogin [SERVER_URL stringByAppendingString:@"/v2/quick/isOldUser"]

#define ClassificationUrl [SERVER_URL stringByAppendingString:@"/getTypeProduct"]

#define CheckShenFenZheng [SERVER_URL stringByAppendingString:@"/check"]
#define ScreeningProductUrl [SERVER_URL stringByAppendingString:@"/screening"]

#endif /* XTDefine_h */
