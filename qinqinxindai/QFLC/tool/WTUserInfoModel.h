//
//  WTUserInfoModel.h
//  ZhuDaiTong
//
//  Created by zrmac on 19.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTUserInfoModel : NSObject
@property (nonatomic, strong) NSString       *nickname;
@property (nonatomic, copy) NSString         *mobile;
@property (nonatomic, copy) NSString         *avatar;
@property (nonatomic, copy) NSString         *localAvatar;


@property (nonatomic, copy) NSDate         *huiyuanDays;
@property (nonatomic, copy) NSString         *isZhouKa;
@property (nonatomic, copy) NSString         *isYueKa;




@end

NS_ASSUME_NONNULL_END
