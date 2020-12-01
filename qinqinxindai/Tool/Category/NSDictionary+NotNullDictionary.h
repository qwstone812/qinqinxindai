//
//  NSDictionary+NotNullDictionary.h
//  baichiBusiness
//
//  Created by lyc on 14-4-20.
//  Copyright (c) 2014年 li.aeli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NotNullDictionary)
- (id)objectForKeyOrNil:(id)key;

@end
