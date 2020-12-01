//
//  QQXDManager.h
//  XJXinDai
//
//  Created by Miley on 2020/11/22.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQXDManager : NSObject

@property (strong, nonatomic)NSArray * orders;
@property (strong, nonatomic)NSArray * zhanYeArr;

+(instancetype)shareInstance;
@property (strong, nonatomic)  NSMutableArray *friendArr;
-(NSDictionary *)findFriendDicWithName:(NSString *)name;

@property (nonatomic,strong)NSMutableArray * weibiRecords;//亲亲币充值消耗记录
@property (nonatomic,strong)NSString * currentWeiBi;//当前亲亲币余额
-(void)increaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason;//增加亲亲币
-(void)decreaseWeiBiWithAmount:(CGFloat)amount reason:(NSString *)reason;//减少亲亲币
-(BOOL)checkWeiBiIsEnoughWithCost:(CGFloat)cost;
@end

NS_ASSUME_NONNULL_END
