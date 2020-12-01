//
//  DSNTool.h
//  YouNiJie
//
//  Created by Miley on 2020/10/27.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DSNTool : NSObject
// 创建lable
- (UILabel*)createLabelWithFrame:(CGRect)frame Font:(UIFont*)font TextColor:(UIColor*)color TextPosin:(NSTextAlignment)posi BackgourndColor:(UIColor*)backColor text:(NSString*)text;
// 创建button
- (UIButton*)createButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color font:(UIFont *)font target:(id)target action:(SEL)action;

- (UIButton*)createButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color WithBackgroundImage:(UIImage*)backgroudImage target:(id)target action:(SEL)action;

- (UIImageView*)createImageViewWithFrame:(CGRect)frame image:(UIImage*)image;

+ (UILabel*)LabelWithFrame:(CGRect)frame Font:(UIFont*)font TextColor:(UIColor*)color TextPosin:(NSTextAlignment)posi BackgourndColor:(UIColor*)backColor text:(NSString*)text;

+ (UIButton*)ButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UIButton*)ButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color WithBackgroundImage:(UIImage*)backgroudImage target:(id)target action:(SEL)action;

+ (UIImageView*)ImageViewWithFrame:(CGRect)frame image:(UIImage*)image;
@end

NS_ASSUME_NONNULL_END
