//
//  ZRSegmentedControl.m
//  DengHaiSeed
//
//  Created by mac on 6.11.19.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "ZRSegmentedControl.h"



@implementation ZRSegmentedControl



/**
 初始化

 @param frame 坐标
 @param titleArr 标题数组
 @return 控制器
 */
- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArr{
 
    self = [super initWithFrame:frame];
    if (self) {
        
        for (NSInteger i = 0; i < titleArr.count; i++) {
            [self insertSegmentWithTitle:titleArr[i] atIndex:i animated:YES];
        }
        
        if (@available(iOS 13.0, *)) {
            //设置背景颜色
//            [self setTintColor:[MTool colorWithHexString:@"#20C22C"]];
            //            设置字体默认颜色
            [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:hexColor(666666)} forState:UIControlStateNormal];
            //            设置字体选中颜色
            [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:ThemeColor} forState:UIControlStateSelected];
        }else{
            //设置背景颜色
            [self setTintColor:ThemeColor];
            //            设置字体默认颜色
            [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:hexColor(666666)} forState:UIControlStateNormal];
            //            设置字体选中颜色
            [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
        }

        self.selectedSegmentIndex = 0;
        
        //添加点击事件
        [self addTarget:self action:@selector(segChaneg:) forControlEvents:UIControlEventValueChanged];

        
    }
    return self;
}

- (void)setNormalColor:(UIColor *)normalColor{
    //设置字体默认颜色
               [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:normalColor} forState:UIControlStateNormal];
}

- (void)setSelectedColor:(UIColor *)selectedColor{
    //设置字体选中颜色
              [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:selectedColor} forState:UIControlStateSelected];
}

- (void)segChaneg:(UISegmentedControl *)seg{
    
    if (self.segmentClickBlock) {
        self.segmentClickBlock(seg.selectedSegmentIndex);
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
