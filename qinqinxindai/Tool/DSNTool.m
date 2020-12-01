//
//  DSNTool.m
//  YouNiJie
//
//  Created by Miley on 2020/10/27.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "DSNTool.h"
@implementation DSNTool
- (UILabel*)createLabelWithFrame:(CGRect)frame Font:(UIFont*)font TextColor:(UIColor*)color TextPosin:(NSTextAlignment)posi BackgourndColor:(UIColor*)backColor text:(NSString*)text
{
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:font];
    [label setTextColor:color];
    [label setTextAlignment:posi];
    [label setBackgroundColor:backColor];
    [label setText:text];
    return label;
}

- (UIButton*)createButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font= font;
    return btn;
}

- (UIButton*)createButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color WithBackgroundImage:(UIImage*)backgroudImage target:(id)target action:(SEL)action
{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:backgroudImage forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (UIImageView*)createImageViewWithFrame:(CGRect)frame image:(UIImage*)image
{
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:image];
    imageView.userInteractionEnabled = YES;
    return imageView;
}

+ (UILabel*)LabelWithFrame:(CGRect)frame Font:(UIFont*)font TextColor:(UIColor*)color TextPosin:(NSTextAlignment)posi BackgourndColor:(UIColor*)backColor text:(NSString*)text
{
    DSNTool* tool = [[DSNTool alloc] init];
    UILabel* label = [tool createLabelWithFrame:frame Font:font TextColor:color TextPosin:posi BackgourndColor:backColor text:text];
    return label;
}

+ (UIButton*)ButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    DSNTool* tool = [[DSNTool alloc] init];
    UIButton* btn = [tool createButtonWithFrame:frame image:image title:title titleColor:color font:font target:target action:action];
    return btn;
}

+ (UIButton*)ButtonWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title titleColor:(UIColor*)color WithBackgroundImage:(UIImage*)backgroudImage target:(id)target action:(SEL)action
{
    DSNTool* tool = [[DSNTool alloc] init];
    UIButton* btn = [tool createButtonWithFrame:frame image:image title:title titleColor:color WithBackgroundImage:backgroudImage target:target action:action];
    return btn;
}

+ (UIImageView*)ImageViewWithFrame:(CGRect)frame image:(UIImage*)image
{
    DSNTool* tool = [[DSNTool alloc] init];
    UIImageView* imageView = [tool createImageViewWithFrame:frame image:image];
    return imageView;
}
@end
