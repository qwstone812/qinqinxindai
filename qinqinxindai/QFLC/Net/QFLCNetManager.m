//
//  QFLCNetManager.m
//  qinqinxindai
//
//  Created by zrmac on 3.12.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLCNetManager.h"

@implementation QFLCNetManager
//首页新闻列表
+(void)qflcPostRequsetWithUrl:(NSString *)urlString Paramater:(NSDictionary *)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock{
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
    [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"terminal"];
    [manager.requestSerializer setValue:([kDefaults objectForKey:@"Customers"][@"message"] ? [kDefaults objectForKey:@"Customers"][@"message"] : @"1") forHTTPHeaderField:@"rvs"];
//    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"rvs"];


    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"channel"];
    [manager.requestSerializer setValue:(DaichaoToken?DaichaoToken:@"") forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:[Utilities getUUID] forHTTPHeaderField:@"deviceId"];
    [manager.requestSerializer setValue:Header_channel forHTTPHeaderField:@"channel"];
        [manager.requestSerializer setValue:Header_name forHTTPHeaderField:@"name"];
    
    
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
+(void)qflcgetRequsetWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock{
    
    
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

+ (void)getSmsCodeWithUrl:(NSString*)urlString Paramater:(NSDictionary*)param SuccessBlock:(SuccessBlock)successBlock FailBlock:(FailBlock)failBlock{
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
       manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/json", nil];
       [manager.requestSerializer setValue:@"2" forHTTPHeaderField:@"terminal"];
       [manager.requestSerializer setValue:DCCHANNEL forHTTPHeaderField:@"channel"];
       [manager.requestSerializer setValue:(DaichaoToken?DaichaoToken:@"") forHTTPHeaderField:@"token"];
//       NSLog(@"deviceId : %@",[DKBUtilities getUUID]);
       [manager.requestSerializer setValue:[Utilities getUUID] forHTTPHeaderField:@"deviceId"];
       [manager.requestSerializer setValue:KVERSION forHTTPHeaderField:@"version"];    
        [manager.requestSerializer setValue:Header_name forHTTPHeaderField:@"name"];

    
    NSArray * allkeys = [[param allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *str1 = obj1;
        NSString *str2 = obj2;
        return [str1 compare:str2];
    }];;
    NSMutableString * str = [NSMutableString string];
    for (NSString * key in allkeys) {
        [str appendFormat:@"%@%@",key,param[key]];
    }
    NSString * salt = [self sha1:urlString];
    NSString * startStr = [str substringToIndex:3];
    NSString * endStr = [str substringFromIndex:str.length-3];
    NSString * longStr = [NSString stringWithFormat:@"%@%@%@",startStr,endStr,salt];
    NSString * sign = [self sha1:longStr];
    [manager.requestSerializer setValue:sign forHTTPHeaderField:@"X-Sign"];

       [manager POST:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
           NSString * jsonStr ;
           if (responseObject) {
               NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
               jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
           }
           
           //        NSLog(@"%@",jsonStr);
           NSLog(@"url = %@ ;\n params = %@ \n,res = %@",urlString,param,jsonStr);
           successBlock(responseObject);
           
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           NSLog(@"%@",error);
           failBlock(error);
       }];
}
+ (NSString *) sha1:(NSString *)input{
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];

    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, (unsigned int)data.length, digest);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}
@end
