//
//  ZRAlertController.h
//  ZYJSVPN
//
//  Created by mac on 2019/1/3.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRAlertController : UIAlertController

+ (instancetype)initZRAlerControllerWithTitle:(NSString *)title message:(NSString *)message style:(NSString *)style titleArr:(NSArray *)titleArr alerAction:(void (^)(NSString * itemStr, NSInteger index))alerAction;

-(void)showWBAler;

@end

NS_ASSUME_NONNULL_END
