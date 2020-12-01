//
//  ZZNetTool.m
//  XiaoHengPuHuiJieTiao
//
//  Created by Miley on 2020/9/29.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "ZZNetTool.h"

@implementation ZZNetTool
//首页新闻列表
+(void)dkk_PostRequsetWithUrl:(NSString *)urlString Paramater:(NSDictionary *)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock{
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"terminal"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"channel"];
    [manager.requestSerializer setValue:(DaichaoToken?DaichaoToken:@"") forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:[Utilities getUUID] forHTTPHeaderField:@"deviceId"];
    [manager POST:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            successBlock(responseObject);
        });
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        dispatch_async(dispatch_get_main_queue(), ^{
            failBlock(error);
        });
        
    }];
}
+(void)dkk_getRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"terminal"];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"channel"];
    [manager.requestSerializer setValue:(DaichaoToken?DaichaoToken:@"") forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:[Utilities getUUID] forHTTPHeaderField:@"deviceId"];
    [manager GET:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        //        NSString * jsonStr ;
        dispatch_async(dispatch_get_main_queue(), ^{
            successBlock(responseObject);
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failBlock(error);
        });
        //        failBlock(error);
    }];
}
@end
