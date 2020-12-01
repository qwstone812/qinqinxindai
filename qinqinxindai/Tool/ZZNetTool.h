//
//  ZZNetTool.h
//  XiaoHengPuHuiJieTiao
//
//  Created by Miley on 2020/9/29.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailBlock)(NSError* error);

@interface ZZNetTool : NSObject
//首页列表
+(void)dkk_PostRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock;
//首页列表
+(void)dkk_getRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock;
@end


