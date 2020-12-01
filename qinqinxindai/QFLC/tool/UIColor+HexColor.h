//
//  LDYCompareViewController.h
//  领调云
//
//  Created by cxx on 16/4/20.
//  Copyright © 2016年 CAPF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)
+ (UIColor*) colorWithHexString:(NSString *)color;
+ (UIColor*) colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor*) colorWithHex:(long)hexColor;
@end
