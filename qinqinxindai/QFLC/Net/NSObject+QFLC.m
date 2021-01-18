//
//  NSObject+QFLC.m
//  DiShuiManager
//
//  Created by Miley on 2020/11/26.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "NSObject+QFLC.h"
#import "QFLCProtocalVC.h"
#import "QFLC_TabBarVC.h"
@implementation NSObject (QFLC)
-(void)tiaozhuanyemian{
    NSDictionary * responseObject = [kDefaults objectForKey:@"Customers"];
    if([[responseObject[@"insc"] description] isEqualToString:@"1"] && ![[responseObject[@"version"] description] isEqualToString:[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"]]){
//        QFLCProtocalVC * target = [[QFLCProtocalVC alloc]init];
//        target.url = responseObject[@"data"];
//        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:target];
//        navi.modalPresentationStyle = UIModalPresentationFullScreen;
//        [[Utilities appDelegate].window.rootViewController presentViewController:navi animated:NO completion:^{
//
//        } ];
        
        [[QFLC_TabBarVC sharedDYQCTabBarVC] setupChilds];;
    }
}
@end
