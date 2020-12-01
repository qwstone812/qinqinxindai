//
//  OrderListModel.m
//  ZYJSVPN
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019年 ZrteC. All rights reserved.
//

#import "OrderListModel.h"

@implementation OrderListModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
   
    [aCoder encodeObject:self.card_id forKey:@"card_id"];
    [aCoder encodeObject:self.pay_type_name forKey:@"pay_type_name"];
    [aCoder encodeObject:self.money forKey:@"money"];
    [aCoder encodeObject:self.create_time forKey:@"create_time"];
    [aCoder encodeObject:self.status forKey:@"status"];


}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.card_id = [aDecoder decodeObjectForKey:@"card_id"];
        self.pay_type_name = [aDecoder decodeObjectForKey:@"pay_type_name"];
        self.money = [aDecoder decodeObjectForKey:@"money"];
        self.create_time = [aDecoder decodeObjectForKey:@"create_time"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
    }
    return self;

}
@end
