//
//  QFLCNetManager.h
//  qinqinxindai
//
//  Created by zrmac on 3.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailBlock)(NSError* error);

@interface QFLCNetManager : NSObject

+ (void)getSmsCodeWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock;


//首页列表
+(void)qflcPostRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock;
//首页列表
+(void)qflcgetRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock;




@end

NS_ASSUME_NONNULL_END
