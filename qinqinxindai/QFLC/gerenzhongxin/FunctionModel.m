//
//  FunctionModel.m
//  AloneWalker
//
//  Created by mac on 18/06/2019.
//  Copyright © 2019 ZrteC. All rights reserved.
//

#import "FunctionModel.h"

@implementation FunctionModel

- (instancetype)initWithTitle:(NSString *)title  IconStr:(NSString *)iconStr {
    
    self = [super init];
    if (self) {
        
        self.functionTitle = title;
        self.functionIcon = iconStr;
    }
    return self;
    
}


- (instancetype)initWithTitle:(NSString *)title  IconStr:(NSString *)iconStr UrlStr:(NSString *)urlStr{
    
    self = [super init];
    if (self) {
        
        self.functionTitle = title;
        self.functionIcon = iconStr;
        self.functionUrl = urlStr;
    }
    return self;
    
}

@end
