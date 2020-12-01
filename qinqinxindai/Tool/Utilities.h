//
//  Utilities.h
//  JieKuanQuan
//
//  Created by Miley on 2018/11/14.
//  Copyright © 2018 wyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "AppDelegate.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickAction)(void);
typedef void(^ClickTextAction)(NSString * result);

@interface Utilities :NSObject
+(NSDictionary *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key;

+(void)delay:(CGFloat)second view:(UIView * )view action:(ClickAction)confirmAction;

+(UIAlertController *)textFieldAlertWithTitle:(NSString *)title message:(NSString *)message ConfirmTitle:( NSString *)confirmTitle cancelTitle:(nullable NSString *)cancelTitle controller:(UIViewController *)controller Confirm:(ClickTextAction)confirmAction cancelAction:(ClickAction)cancelAction defaultText:(NSString *)defaultText placeholder:(NSString *)placeholder;

+(void)callPhone:(NSString *)phone;
+(UIView *)setupFooterView;
+(void)setCompanyNameWith:(NSString * )str;
+(AppDelegate*)appDelegate;
+(BOOL)checkIsLogin;
+(UIFont*)getFontWithSize:(CGFloat)size;
+(UIFont*)getMedumFontWithSize:(CGFloat)size;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
//检查通讯录权限
+ (void)checkAddressBookIOS9AfterAuthorization:(void (^)(bool isAuthorized))block;
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+(BOOL)checkWDIsLogin;
+(void)gotoQFLCLoginWith:(UIViewController *)controller;
+(void)gotoLogin2With:(UIViewController *)controller;

+ (NSString*)objectToJson:(id )dic;
+(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message ConfirmTitle:( NSString *)confirmTitle cancelTitle:(nullable NSString *)cancelTitle controller:(UIViewController *)controller Confirm:(ClickAction)confirmAction cancelAction:(ClickAction)cancelAction;
+ (NSString *)md5_32bit:(NSString *)input;
+(NSString *)getCurrentDateString;

+ (NSString *)getUUID;
//


@end

NS_ASSUME_NONNULL_END
