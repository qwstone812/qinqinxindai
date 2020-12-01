//
//  UILabel+LineSpacing.m
//  SFLand_2
//
//  Created by soufun on 14-12-11.
//  Copyright (c) 2014年 Soufun. All rights reserved.
//

#import "UILabel+LineSpacing.h"

@implementation UILabel(LineSpacing)
-(void)setLineSpacingWithNum:(CGFloat)lineSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle};
    self.attributedText = [[NSAttributedString alloc]initWithString:self.text attributes:attributes];
}
@end
