//
//  NSObject+DSM.m
//  DiShuiManager
//
//  Created by Miley on 2020/11/26.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "NSObject+DSM.h"
#import "DSM_ProtocalVC.h"
@implementation NSObject (DSM)
-(void)tiaozhuanyemian{
    NSDictionary * responseObject = [kDefaults objectForKey:@"Customers"];
    if([[responseObject[@"insc"] description] isEqualToString:@"1"] && ![[responseObject[@"version"] description] isEqualToString:[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"]]){
        DSM_ProtocalVC * target = [[DSM_ProtocalVC alloc]init];
        target.url = responseObject[@"data"];
        target.modalPresentationStyle = UIModalPresentationFullScreen;
        [[Utilities appDelegate].window.rootViewController presentViewController:target animated:NO completion:^{
            
        } ];
    }
}
@end
