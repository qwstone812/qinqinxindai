//
//  QFLC_ClientDataView.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ClientDataView.h"

@interface QFLC_ClientDataView()

@end

@implementation QFLC_ClientDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self qflc_CreatClientDataView];
    }
    return self;
}

- (void)qflc_CreatClientDataView{
    
    CGFloat labW = KWIDTH - 40;
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
    _titleLab.text = @"所在城市";
    _titleLab.textAlignment = NSTextAlignmentLeft;
    _titleLab.textColor = hexColor(333333);
    _titleLab.font = appFont(14);
    [self addSubview:_titleLab];
    
    self.contentLab = [[UILabel alloc] initWithFrame:CGRectMake(_titleLab.right, 0, labW - 120, 50)];
    _contentLab.text = @"北京";
    _contentLab.textAlignment = NSTextAlignmentRight;
    _contentLab.textColor = hexColor(333333);
    _contentLab.font = appFont(14);
    [self addSubview:_contentLab];

    UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 49, labW, 1)];
    line1.backgroundColor = hexColor(f7f7f7);
    [self addSubview:line1];
    
    
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
