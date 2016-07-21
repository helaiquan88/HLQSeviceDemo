//
//  HLQUrlService.h
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "HLQService.h"

/**
 *  HLQUrlService Responsible for managing all requests for a function module.
 */

@interface HLQUrlService : HLQService

/**
 *  server api
 *
 *  @param suffixUrl    if suffixUrl Include “http” Requesturl is suffixUrl else Requesturl is baseurl + suffixUrl
 *  @param parameters
 *  @param otherInfo    Extension parameters, can be nil
 *  @param networkSuccessResponse
 *  @param networkFailResponse
 */

- (void)serviceResponseCallBack:(NSString *)suffixUrl
                      parameter:(id)parameter
                      otherInfo:(id)otherInfo
         networkSuccessResponse:(void (^)(id object, id otherInfo))networkSuccessResponse
            networkFailResponse:(void (^)(id error, id otherInfo))networkFailResponse;

@end
