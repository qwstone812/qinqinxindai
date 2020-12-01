//
//  QFLC_ForumDetail.h
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_RootVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface QFLC_ForumDetail : QFLC_RootVC

@property (nonatomic, strong) NSString      *qflc_title;
@property (nonatomic, strong) NSString      *content;

@property (strong, nonatomic)  UITextView *textView;

@end

NS_ASSUME_NONNULL_END
