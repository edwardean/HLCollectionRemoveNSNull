//
//  NSObject+HLCollectionRemoveNSNull.m
//  HLCollectionRemoveNSNull
//
//  Created by lihang on 2017/11/2.
//  Copyright © 2017年 HerryLee. All rights reserved.
//

#import "NSObject+HLCollectionRemoveNSNull.h"

@implementation NSDictionary (HLDictionaryRemoveNull)

- (NSDictionary *)HLRemoveNullKeyValues
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:self];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *innerDict = object;
            replaced[key] = [innerDict HLRemoveNullKeyValues];
        }
        else if ([object isKindOfClass:[NSArray class]]) {
            NSArray *nullFreeArray = [object HLRemoveNullObjects];
            replaced[key] = nullFreeArray;
        }
        else {
            if (object == [NSNull null]) {
                [replaced removeObjectForKey:key];
            }
        }
    }];
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end

@implementation NSArray (HLArrayRemoveNull)

- (NSArray *)HLRemoveNullObjects
{
    NSMutableArray *nullFreeRecords = [NSMutableArray array];
    for (id object in self) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *nullFreeRecord = [object HLRemoveNullKeyValues];
            [nullFreeRecords addObject:nullFreeRecord];
        } else if ([object isKindOfClass:[NSArray class]]) {
            [nullFreeRecords addObject:[object HLRemoveNullObjects]];
        } else if (object != [NSNull null]) {
            [nullFreeRecords addObject:object];
        }
    }
    return [nullFreeRecords copy];
}

@end

