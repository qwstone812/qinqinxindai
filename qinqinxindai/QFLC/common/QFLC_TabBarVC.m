//
//  QFLC_TabBarVC.m
//  qinqinxindai
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_TabBarVC.h"

#import "QFLC_DengLuVC.h"

@interface QFLC_TabBarVC ()<UITabBarControllerDelegate>
@property (nonatomic,strong)NSMutableArray * array;

@end

@implementation QFLC_TabBarVC

+ (instancetype)sharedDYQCTabBarVC {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        
        [instance init_DYQCTabBarC];
    });
    return instance;
}

- (void)init_DYQCTabBarC{
    _array = [NSMutableArray array];
    self.delegate = self;

    
   
    
    NSArray * tabItems = @[
    @{@"name":@"QFLC_HomeVC",@"title":@"首页",@"image":@"dyqctabbar_unshouyeshouye",@"selectedImg":@"dyqctabbar_shouyeshouye"},
    @{@"name":@"QFLC_ClientListVC",@"title":@"抢单大厅",@"image":@"dyqctabbar_unkehu",@"selectedImg":@"dyqctabbar_kehu"},
    @{@"name":@"QFLC_ForumVC",@"title":@"学习文章",@"image":@"tabbar_wanzhang",@"selectedImg":@"tabbar_wanzhang"},

    @{@"name":@"QFLC_GRZXVC",@"title":@"个人中心",@"image":@"dyqctabbar_unwode",@"selectedImg":@"dyqctabbar_wode"}
    ];
    
    
    for (NSDictionary * dic in tabItems) {
        UIViewController * vc = [[NSClassFromString(dic[@"name"]) alloc]init];
        vc.tabBarItem.title = dic[@"title"];
        vc.tabBarItem.image = [UIImage imageNamed:dic[@"image"]];;
//        vc.tabBarItem.selectedImage = [[UIImage imageNamed:dic[@"selectedImg"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
        //    [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [_array addObject:[[UINavigationController alloc]initWithRootViewController:vc]];
    }
    [self setViewControllers:_array animated:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


+(void)initialize{
    UITabBar* tabbar = [UITabBar appearance];
    tabbar.tintColor = ThemeColor ;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (![Utilities checkIsLogin]) {
        if ([tabBarController.viewControllers indexOfObject:viewController] == 1 || [tabBarController.viewControllers indexOfObject:viewController] == 3) {
            QFLC_DengLuVC * login = [[QFLC_DengLuVC alloc]init];
            UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:login];
            nav.modalPresentationStyle = UIModalPresentationFullScreen;
            [viewController presentViewController:nav animated:YES completion:nil];
            
            return NO;
        }
    }
    return YES;;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
