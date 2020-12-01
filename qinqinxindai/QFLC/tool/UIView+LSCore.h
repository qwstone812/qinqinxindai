//
//  UIView+LSCore.h
//  AloneWalker
//
//  Created by mac on 10/06/2019.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LSCore)
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
@end

NS_ASSUME_NONNULL_END
