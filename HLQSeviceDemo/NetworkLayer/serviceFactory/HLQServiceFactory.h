//
//  HLQServiceFactory.h
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Service factory manages all service, include loading and unloading service. You can use PF_SERVICE macro to get specific service.
 */

@interface HLQServiceFactory : NSObject

+ (instancetype)sharedServiceFactory;

- (id)serviceWithServiceName:(NSString *)serviceName;

- (void)unloadServiceWithServiceName:(NSString *)serviceName;
- (void)unloadServiceWithServiceName:(NSString *)serviceName
                       isForceUnload:(BOOL)isForceUnload;

@end
