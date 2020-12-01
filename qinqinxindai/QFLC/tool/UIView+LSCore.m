//
//  UIView+LSCore.m
//  AloneWalker
//
//  Created by mac on 10/06/2019.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "UIView+LSCore.h"

@implementation UIView (LSCore)

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}
@end
