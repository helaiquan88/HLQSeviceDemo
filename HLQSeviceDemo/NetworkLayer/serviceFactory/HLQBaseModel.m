//
//  HLQBaseModel.m
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "HLQBaseModel.h"

@interface HLQBaseModel ()<NSCoding, NSCopying>

@end

@implementation HLQBaseModel

#pragma mark - life cycle

/// 持久化缓存
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self yy_modelEncodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    return [self yy_modelInitWithCoder:aDecoder];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [self yy_modelCopy];
}

+ (id)convertToModel:(NSString *)JSONString
{
    id model = nil;
    if ([JSONString isKindOfClass:[NSArray class]]) {
        model = [NSArray yy_modelArrayWithClass:[self class] json:JSONString];
    }
    
    if ([JSONString isKindOfClass:[NSDictionary class]]) {
        model = [[self class] yy_modelWithJSON:JSONString];
        
    }
    if ([JSONString isKindOfClass:[NSString class]]) {
        model = [JSONString hasPrefix:@"["] ? [NSArray yy_modelArrayWithClass:[self class] json:JSONString] : [[self class] yy_modelWithJSON:JSONString];
    }
    return model;
}


@end
