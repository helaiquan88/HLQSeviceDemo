//
//  HLQBaseRequest.h
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "YTKBaseRequest.h"

@interface HLQBaseRequest : YTKBaseRequest

/**
 *  Judge if model shoud need save to disk
 *
 *  @return YES: need
 */
@property (nonatomic, assign) BOOL isSaveToDisk;

/**
 *  Judge if model shoud need save to cashe
 *
 *  @return YES: need
 */
@property (nonatomic, assign) BOOL isSaveToCashe;

///if suffixUrl Include “http” Requesturl is suffixUrl else Requesturl is baseurl + suffixUrl
@property (nonatomic, strong) NSString *suffixUrl;

@property (nonatomic, strong) NSDictionary *parameters;

@property (nonatomic, strong) Class modelClass;

@property (nonatomic, assign) YTKRequestMethod requestMethodType;

@property (nonatomic, copy) void (^networkSuccessResponse)(id object, id otherInfo);

@property (nonatomic, copy) void (^networkFailResponse)(id error, id otherInfo);

- (instancetype)initWithUrl:(NSString *)suffixUrl
                 parameters:(NSDictionary *)parameters
                 modelClass:(Class)modelClass
               isSaveToDisk:(BOOL)isSaveToDisk;

// convert and operate
- (id)convertToModel:(NSString *)JSONString;
- (id)currentResponseModel;

@end
