//
//  NSDictionary+NotNullDictionary.m
//  baichiBusiness
//
//  Created by lyc on 14-4-20.
//  Copyright (c) 2014年 li.aeli. All rights reserved.
//

#import "NSDictionary+NotNullDictionary.h"

@implementation NSDictionary (NotNullDictionary)

- (id)objectForKeyOrNil:(id)key {
    id val = [self objectForKey:key];
    if ([val isEqual:[NSNull null]] ) {
        return @"";
    }
    return val;
}

@end
