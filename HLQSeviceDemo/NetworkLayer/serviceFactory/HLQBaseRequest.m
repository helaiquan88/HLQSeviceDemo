//
//  HLQBaseRequest.m
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "HLQBaseRequest.h"

#import "YYModel.h"
#import "HLQBaseModel.h"

@implementation HLQBaseRequest

#pragma mark - overwrite

- (BOOL)ignoreCache
{
    return YES;
}

/// return requestMethod can be YTKRequestMethodGet YTKRequestMethodPost ...
- (YTKRequestMethod)requestMethod
{
    return self.requestMethodType;
}

/// return yours domain url
- (NSString *)baseUrl
{
    
    return @"";
    
}

/// return yours suffix url
- (NSString *)requestUrl
{
    
    if (self.suffixUrl) {
        return self.suffixUrl;
    }
    return @"";
    
}

/// Processing parameters ， you can encryption your parameters in this
- (id)requestArgument
{
    
    NSDictionary *para = [self parameters];
    return para;
    
}

/// Processing the request results, you can do this in the cache
- (void)requestCompleteFilter
{
    
    if (!self.isSaveToCashe && !self.isSaveToDisk)
    {
        return;
    }
    
    if (self.isSaveToCashe)
    {
        
    }
    
    if (self.isSaveToDisk)
    {
        
    }
    
}

#pragma mark - life cycle

- (instancetype)initWithUrl:(NSString *)suffixUrl
                 parameters:(NSDictionary *)parameters
                 modelClass:(Class)modelClass
               isSaveToDisk:(BOOL)isSaveToDisk
{
    self = [super init];
    if (self)
    {
        self.suffixUrl = suffixUrl;
        self.parameters = parameters;
        
        self.requestMethodType = YTKRequestMethodPost;
        
        self.isSaveToDisk = isSaveToDisk;
        
        if (modelClass)
        {
            self.modelClass = modelClass;
        }
        else
        {
            self.modelClass = [HLQBaseModel class];
        }
        
    }
    
    return self;
    
}

#pragma mark - public

- (id)currentResponseModel
{
    id model = [self convertToModel:[self responseString]];
    
    return model;
}

- (id)convertToModel:(NSString *)JSONString
{
    NSString *responseString = [self responseString];
    
    id model = [responseString hasPrefix:@"["] ? [NSArray yy_modelArrayWithClass:self.modelClass json:responseString] : [self.modelClass yy_modelWithJSON:responseString];
    return model;
}

#pragma mark - private method

#pragma mark - getters and setters

- (NSDictionary *)parameters
{
    if (!_parameters) {
        _parameters = @{};
    }
    return _parameters;
}

@end
