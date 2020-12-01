//
//  QFLC_MineTopItemView.m
//  ZhuDaiTong
//
//  Created by zrmac on 19.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_MineTopItemView.h"

@implementation QFLC_MineTopItemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dxg_initDXGMineTopItemView];
    }
    return self;
}


- (void)updateMoney{
    UILabel * lab =   [self viewWithTag:200];
    lab.text = [NSString stringWithFormat:@"亲亲币：%@",[QQXDManager shareInstance].currentWeiBi];

}

- (void)dxg_initDXGMineTopItemView{
    NSInteger count = 2;
    float bgWidth = (KWIDTH-40)/count;
    float bgHeight = 80;
    
    
    NSArray * iconArray = @[@"mine_xiaofeijilu",@"mine_chongzhi"];
    
    //,@"YD_Home_add"@"YD_Home_jisuanqi",@"添加好友",@"利息计算",,@"新增好友"@"计算利息",
    NSArray * titleArray = @[[NSString stringWithFormat:@"亲亲币%@",[QQXDManager shareInstance].currentWeiBi],@"充值记录"];
    for (NSInteger i = 0; i < iconArray.count; i++) {
        UIView * titleBG = [[UIView alloc] initWithFrame:CGRectMake((i%count)*bgWidth, (i/count)*bgHeight, bgWidth, bgHeight)];
        [self addSubview:titleBG];
        
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake((bgWidth-30)/2, 10, 30, 30)];
        icon.image = Img(iconArray[i]);
        [titleBG addSubview:icon];
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, icon.bottom + 5, bgWidth, 30)];
        titleLabel.text = titleArray[i];
        titleLabel.tag = 200+i;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = hexColor(333333);
        [titleBG addSubview:titleLabel];
        
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, bgWidth, bgHeight);
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleBG addSubview:btn];
    }
    
}

- (void)itemClick:(UIButton *)sender{
    if (sender.tag == 100) {
        if (self.jinbiRecord) {
            self.jinbiRecord();
        }
    }else{
        if (self.rechargeRecord) {
            self.rechargeRecord();
        }
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
