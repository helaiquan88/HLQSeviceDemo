//
//  HLQService.h
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HLQBaseRequest;
@interface HLQService : NSObject

/**
 *  Return the class name of service, subClass must overwrite.
 *
 *  @return Service class name.
 */
+ (NSString *)serviceName;

/**
 *  Judge if service will be unloaded if no user used it.
 *
 *  @return YES: need
 */
- (BOOL)needUnloading;

/**
 *  service startRequest.
 *
 */
- (void)startRequest:(HLQBaseRequest *)request
           otherInfo:(id)otherInfo;

@end
