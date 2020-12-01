//
//  WTUserInfoModel.m
//  ZhuDaiTong
//
//  Created by zrmac on 19.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "WTUserInfoModel.h"

@implementation WTUserInfoModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
   
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.localAvatar forKey:@"localAvatar"];
    [aCoder encodeObject:self.isZhouKa forKey:@"isZhouKa"];
    [aCoder encodeObject:self.isYueKa forKey:@"isYueKa"];
    [aCoder encodeObject:self.huiyuanDays forKey:@"huiyuanDays"];


}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.localAvatar = [aDecoder decodeObjectForKey:@"localAvatar"];
        self.isZhouKa = [aDecoder decodeObjectForKey:@"isZhouKa"];
        self.isYueKa = [aDecoder decodeObjectForKey:@"isYueKa"];
        self.huiyuanDays = [aDecoder decodeObjectForKey:@"huiyuanDays"];
    }
    return self;

}

@end
