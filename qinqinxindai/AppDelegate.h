//
//  AppDelegate.h
//  YiJieTiao
//
//  Created by Miley on 2019/11/25.
//  Copyright © 2019 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "QFLC_TabBarVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

