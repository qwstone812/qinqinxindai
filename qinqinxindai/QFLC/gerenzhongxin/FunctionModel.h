//
//  FunctionModel.h
//  AloneWalker
//
//  Created by mac on 18/06/2019.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FunctionModel : NSObject

- (instancetype)initWithTitle:(NSString *)title  IconStr:(NSString *)iconStr;


- (instancetype)initWithTitle:(NSString *)title  IconStr:(NSString *)iconStr UrlStr:(NSString *)urlStr;

@property (nonatomic, copy) NSString        *functionIcon;
@property (nonatomic, copy) NSString        *functionTitle;
@property (nonatomic, copy) NSString        *functionUrl;
@end

NS_ASSUME_NONNULL_END
