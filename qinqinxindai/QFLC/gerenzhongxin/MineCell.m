//
//  MineCell.m
//  AloneWalker
//
//  Created by mac on 18/06/2019.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "MineCell.h"

@interface MineCell()

@property (nonatomic, strong) UIImageView       *functionIcon;
@property (nonatomic, strong) UILabel           *functionLabel;

@property (nonatomic, strong) UIImageView       *arrowIcon;
@property (nonatomic, strong) UIView            *lineView;

@property (nonatomic, strong) UILabel           *versionLabel;

@end

@implementation MineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
    }
    return self;
}


- (void)creatCell{
    
    //icon
    self.functionIcon = [[UIImageView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(15.0), APP_HEIGHT_6S(13.0), APP_WIDTH_6S(22.0), APP_WIDTH_6S(22.0))];
    [self.contentView addSubview:_functionIcon];
    //title
    self.functionLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(6.0) + _functionIcon.right, APP_HEIGHT_6S(13.0), APP_WIDTH_6S(100.0), APP_HEIGHT_6S(22.0))];
//    _functionLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    _functionLabel.textAlignment = NSTextAlignmentLeft;
    _functionLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
    [self.contentView addSubview:_functionLabel];
    
    
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(220.0), APP_HEIGHT_6S(13.0), APP_WIDTH_6S(100.0), APP_HEIGHT_6S(22.0))];
//    _versionLabel.textColor = [UIColor colorWithHexString:@"#979797"];
    _versionLabel.textAlignment = NSTextAlignmentRight;
//    _versionLabel.text = [MTool getAppVersion];
    _versionLabel.hidden = YES;
    _versionLabel.font = [UIFont systemFontOfSize:APP_HEIGHT_6S(14.0)];
    [self.contentView addSubview:_versionLabel];
    
    //arrow
    self.arrowIcon = [[UIImageView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(308.0), APP_HEIGHT_6S(18.0), APP_WIDTH_6S(12.0), APP_WIDTH_6S(12.0))];
    _arrowIcon.image = [UIImage imageNamed:@"mine_arrow"];
    [self.contentView addSubview:_arrowIcon];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(APP_WIDTH_6S(15.0), APP_HEIGHT_6S(49.0)-1, APP_WIDTH_6S(305.0), 1)];
//    _lineView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    [self.contentView addSubview:_lineView];
    
}

- (void)setModel:(FunctionModel *)model{
    _functionIcon.image = [UIImage imageNamed:model.functionIcon];
    _functionLabel.text = model.functionTitle;
    
    if ([model.functionTitle isEqualToString:@"当前版本"]) {
        _lineView.hidden = YES;
        _arrowIcon.hidden = YES;
        _versionLabel.hidden = NO;
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
