//
//  NSObject+HLCollectionRemoveNSNull.h
//  HLCollectionRemoveNSNull
//
//  Created by lihang on 2017/11/2.
//  Copyright © 2017年 HerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HLDictionaryRemoveNull)
- (NSDictionary *)HLRemoveNullKeyValues;
@end

@interface NSArray (HLArrayRemoveNull)
- (NSArray *)HLRemoveNullObjects;
@end
