//
//  LNMineDataView.m
//  DaiWorld
//
//  Created by zrmac on 11.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "LNMineDataView.h"

@implementation LNMineDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatLNMineDataView];
    }
    return self;
}

- (void)creatLNMineDataView{
    
    NSInteger count = 3;
    float bgWidth = (KScreenWidth-40)/count;
    
    self.numLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgWidth, 25)];
    _numLab1.textAlignment = NSTextAlignmentCenter;
    _numLab1.textColor = UIWhiteColor;
    _numLab1.text = @"3";
    _numLab1.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:_numLab1];

    self.desLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, _numLab1.bottom, bgWidth, 25)];
    _desLab1.textAlignment = NSTextAlignmentCenter;
    _desLab1.textColor = UIWhiteColor;
    _desLab1.text = @"金额（万元）";
    _desLab1.font = appFont(12);
    [self addSubview:_desLab1];
    
    
    self.numLab2 = [[UILabel alloc] initWithFrame:CGRectMake(_numLab1.right, 0, bgWidth, 25)];
    _numLab2.textAlignment = NSTextAlignmentCenter;
    _numLab2.textColor = UIWhiteColor;
    _numLab2.text = @"36";
    _numLab2.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:_numLab2];
    
    self.desLab2 = [[UILabel alloc] initWithFrame:CGRectMake(_numLab1.right, _numLab2.bottom, bgWidth, 25)];
    _desLab2.textAlignment = NSTextAlignmentCenter;
    _desLab2.textColor = UIWhiteColor;
    _desLab2.text = @"期数（月）";
    _desLab2.font = appFont(12);
    [self addSubview:_desLab2];
    
    
    self.numLab3 = [[UILabel alloc] initWithFrame:CGRectMake(_numLab2.right, 0, bgWidth, 25)];
    _numLab3.textAlignment = NSTextAlignmentCenter;
    _numLab3.textColor = UIWhiteColor;
    _numLab3.text = @"装修";
    _numLab3.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:_numLab3];
    
    self.desLab3 = [[UILabel alloc] initWithFrame:CGRectMake(_numLab2.right, _numLab3.bottom, bgWidth, 25)];
    _desLab3.textAlignment = NSTextAlignmentCenter;
    _desLab3.textColor = UIWhiteColor;
    _desLab3.text = @"用途";
    _desLab3.font = appFont(12);
    [self addSubview:_desLab3];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
