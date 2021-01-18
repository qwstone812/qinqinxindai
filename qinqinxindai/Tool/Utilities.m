//
//  Utilities.m
//  JieKuanQuan
//
//  Created by Miley on 2018/11/14.
//  Copyright © 2018 wyh. All rights reserved.
//

#import "Utilities.h"
//#import "GSJJLoginVc.h"
#import <AdSupport/AdSupport.h>
//#import "H5ViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "QFLC_DengLuVC.h"
#import "DWOtherDetailVC.h"
@implementation Utilities

+(void)dealWithModel:(DWOtherModel *)model controller:(UIViewController *)controller{
    if (![Utilities checkIsLogin]) {
        [Utilities gotoLogin2With:controller];
        return;
    }
    NSString *deviceID = [RRTool getUUID];
    NSString *token = DaichaoToken;

    NSDictionary *parm = @{@"token":token,@"category_id":@"99",@"product_id":model.product_id,@"pname":model.pname,@"channel_id":@"2",@"channel_nid":deviceID};

    
    
    [QFLCNetManager qflcPostRequsetWithUrl:DCProductDJ_Url Paramater:parm SuccessBlock:^(id responseObject) {
        NSLog(@"success");
    } FailBlock:^(NSError *error) {
        NSLog(@"fail");

    }];
    DWOtherDetailVC* webVC = [[DWOtherDetailVC alloc]init];
    webVC.url = model.product_url;
    webVC.titleProductStr = model.pname;
    [controller.navigationController pushViewController:webVC animated:YES];
}


+(NSDictionary *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key
{
    if (!encryptText && ![encryptText isKindOfClass:[NSString class]]) {
        return nil;
    }
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptText options:NSDataBase64DecodingIgnoreUnknownCharacters];//base64解码
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];

        NSString * str = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        str =[str stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];

        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        if(err) {
            return nil;
        }
        return dic;
    }
    free(buffer);
    return nil;
}
+(void)delay:(CGFloat)second view:(UIView * )view action:(ClickAction)confirmAction{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:view animated:YES];
        confirmAction();
    });
}

+(UIAlertController *)textFieldAlertWithTitle:(NSString *)title message:(NSString *)message ConfirmTitle:( NSString *)confirmTitle cancelTitle:(nullable NSString *)cancelTitle controller:(UIViewController *)controller Confirm:(ClickTextAction)confirmAction cancelAction:(ClickAction)cancelAction defaultText:(NSString *)defaultText placeholder:(nonnull NSString *)placeholder{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIView * subview = alertController.view.subviews.count > 0 ? alertController.view.subviews[0]:nil;
    UIView * alertContentView = subview.subviews.count > 0 ? subview.subviews[0]:nil;
    UIView * realView = alertContentView.subviews.count > 0 ? alertContentView.subviews[0]:nil;

    realView.backgroundColor = UIWhiteColor;
    realView.layer.cornerRadius = 15;
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = placeholder;
        textField.text = defaultText;
        textField.tintColor = hexColor(00BFBF);
//        textField.keyboardType = UIKeyboardTypePhonePad;
    }];
       if (cancelTitle) {
           UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
               if (cancelAction) {
                   cancelAction();
               }
           }];
           [cancel setValue:hexColor(999999) forKey:@"titleTextColor"];


//
           [alertController addAction:cancel];
       }
       UIAlertAction *okAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           UITextField *textField = alertController.textFields.firstObject;

           if (confirmAction) {
               confirmAction(textField.text);
           }
       }];
    [okAction setValue:hexColor(00BFBF) forKey:@"titleTextColor"];
       [alertController addAction:okAction];
       
    NSMutableAttributedString * attr = [[NSMutableAttributedString alloc]initWithString:title];
    [attr addAttributes:@{NSFontAttributeName:appMFont(16),NSForegroundColorAttributeName:hexColor(333333)} range:NSMakeRange(0, title.length)];
    [alertController setValue:attr forKey:@"attributedTitle"];
    
    NSMutableAttributedString * attrMessage = [[NSMutableAttributedString alloc]initWithString:message];
    [attrMessage addAttributes:@{NSFontAttributeName:appFont(14),NSForegroundColorAttributeName:hexColor(666666)} range:NSMakeRange(0, message.length)];
    [alertController setValue:attrMessage forKey:@"attributedMessage"];

       [controller presentViewController:alertController animated:YES completion:nil];
       return alertController;
}
+(void)gotoQFLCLoginWith:(UIViewController *)controller{
    if(![Utilities checkIsLogin]){
        QFLC_Login2VC * login = [[QFLC_Login2VC alloc]init];
        //        login.fromType = [[Utilities appDelegate].nomalType isEqualToString:@"B"] ? @"B" : @"A";
        UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:login];
        nav.modalPresentationStyle = UIModalPresentationFullScreen;

        [controller presentViewController:nav animated:YES completion:nil];    }
//    [controller.navigationController pushViewController:[[GSJJLoginVc alloc]init] animated:YES];
}
+(void)gotoLogin2With:(UIViewController *)controller{
    if(![Utilities checkIsLogin]){
           QFLC_Login2VC * login = [[QFLC_Login2VC alloc]init];
           //        login.fromType = [[Utilities appDelegate].nomalType isEqualToString:@"B"] ? @"B" : @"A";
           UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:login];
           nav.modalPresentationStyle = UIModalPresentationFullScreen;

           [controller presentViewController:nav animated:YES completion:nil];
        
    }
}
+(void)callPhone:(NSString *)phone{
    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    

}
+(UIView *)setupFooterView{
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 50)];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, KWIDTH, 45)];

    label.text = @"Copyright©上海豪之威互联网金融信息服务有限公司";

    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    [footerView addSubview:label];
    return footerView;
}



+(AppDelegate*)appDelegate{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
+(BOOL)checkIsLogin{
    if (DaichaoToken && [DaichaoToken length] > 0) {
        return YES;
    }
    return NO;
}
+(BOOL)checkWDIsLogin{
    if (WDToken && [WDToken length] > 0) {
        return YES;
    }
    return NO;
}

+(UIFont*)getFontWithSize:(CGFloat)size{
  return  [UIFont fontWithName:@"PingFang-SC-Regular" size: size];
}
+(UIFont*)getMedumFontWithSize:(CGFloat)size{
    return  [UIFont fontWithName:@"PingFang-SC-Medium" size: size];
}
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    //if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    //if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //SL_Log(@"%f:::%f:::%f",((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f));
    return [UIColor colorWithRed:(float) r / 255.0f green:(float) g / 255.0f blue:(float) b / 255.0f alpha:1];
}

+ (void)checkAddressBookIOS9AfterAuthorization:(void (^)(bool isAuthorized))block

{
    
    CNContactStore *addressBook = [[CNContactStore alloc]init];
    
    CNAuthorizationStatus authStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];;
    
    if (authStatus != CNAuthorizationStatusAuthorized){
        
        [addressBook requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (error){
                    
                    NSLog(@"ios9以后Error: %@",error);
                    
                    if (error.code == 100) {//ios 9 以后第一次被用户拒绝访问之后就走 error 的方法
                        
                        block(NO);
                        
                    }
                    
                }else if (!granted){
                    
                    block(NO);
                    
                }else{
                    
                    block(YES);
                    
                }
                
            });
            
        }];
        
    }else{
        
        block(YES);
        
    }
    
    
    
}

// 正则判断手机号码地址格式
+ (BOOL)isMobileNumber:(NSString *)mobileNum {//    电信号段:133/153/180/181/189/177//    联通号段:130/131/132/155/156/185/186/145/176//    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178//    虚拟运营商:170
    //    NSString *MOBILE = @"^1(3[0-9]|4[0-9]|5[0-9]|8[0-9]|7[0-9]|9[0-9])\\d{8}$";    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //     return [regextestmobile evaluateWithObject:mobileNum];
    if(mobileNum.length > 0)
        return YES;
    return NO;
    
    
}

+ (NSString*)objectToJson:(id )dic
{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
   
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
+(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message ConfirmTitle:(NSString *)confirmTitle cancelTitle:(nullable NSString *)cancelTitle controller:(UIViewController *)controller Confirm:(ClickAction)confirmAction cancelAction:(ClickAction)cancelAction{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle) {
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelAction) {
                cancelAction();
            }
        }];
        [alertController addAction:cancel];
    }
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmAction) {
            confirmAction();
        }
    }];
    [alertController addAction:okAction];
    
    [controller presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

 + (NSString *)md5_32bit:(NSString *)input {
         //传入参数,转化成char
        const char * str = [input UTF8String];
        //开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
        unsigned char md[CC_MD5_DIGEST_LENGTH];
        /*
           7      extern unsigned char * CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
           8      把str字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了md这个空间中
           9      */
         CC_MD5(str, (int)strlen(str), md);
        //创建一个可变字符串收集结果
         NSMutableString * ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
        for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
                /**
                    15          X 表示以十六进制形式输入/输出
                    16          02 表示不足两位，前面补0输出；出过两位不影响
                    17          printf("%02X", 0x123); //打印出：123
                    18          printf("%02X", 0x1); //打印出：01
                    19          */
                 [ret appendFormat:@"%02X",md[i]];
             }
         //返回一个长度为32的字符串
         return [ret lowercaseString];
     }
+ (NSString *)getCurrentDateString{
     NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
     NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}
+ (void)setCompanyNameWith:(NSString * )str{
    [kDefaults setObject:str forKey:@"companyName"];
    [kDefaults synchronize];
    
}
+ (NSString *)getUUID
{
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]){
        return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    return [UIDevice currentDevice].identifierForVendor.UUIDString;
}





@end
