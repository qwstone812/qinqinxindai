//
//  VerifyView.h
//  xindaiyuan
//
//  Created by 李晨 on 2018/9/13.
//  Copyright © 2018年 jituan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerifyView : UIView

@property(nonatomic,copy)void(^CancelBlock)(void);

@property(nonatomic,copy)void(^VerifyBlock)(void);
@end
