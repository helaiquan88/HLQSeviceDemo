//
//  HLQServiceFactory.m
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "HLQServiceFactory.h"

#import "HLQService.h"

@interface HLQServiceFactory ()

@property (nonatomic, strong) NSMutableDictionary *serviceContainer;

@end

@implementation HLQServiceFactory

#pragma mark - public

+ (instancetype)sharedServiceFactory
{
    static dispatch_once_t once;
    static HLQServiceFactory *instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)serviceWithServiceName:(NSString *)serviceName
{
    NSParameterAssert(serviceName);
    
    HLQService *service = self.serviceContainer[serviceName];
    if (service)
    {
        return service;
    }
    
    [self pf_unloadUnneededService];
    
    service = [[NSClassFromString(serviceName) alloc] init];
    self.serviceContainer[serviceName] = service;
    
    return service;
}

- (void)unloadServiceWithServiceName:(NSString *)serviceName
{
    [self unloadServiceWithServiceName:serviceName isForceUnload:NO];
}

- (void)unloadServiceWithServiceName:(NSString *)serviceName
                       isForceUnload:(BOOL)isForceUnload
{
    NSParameterAssert(serviceName);
    
    HLQService *service = self.serviceContainer[serviceName];
    
    if (!isForceUnload && ![service needUnloading])
    {
        return;
    }
    
    [self.serviceContainer removeObjectForKey:serviceName];
}

#pragma mark - private

- (void)pf_unloadUnneededService
{
    NSMutableArray *unloadingKeys = [NSMutableArray array];
    
    [self.serviceContainer enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, HLQService * _Nonnull obj, BOOL * _Nonnull stop)
     {
         if ([obj needUnloading])
         {
             [unloadingKeys addObject:key];
         }
     }];
    
    [self.serviceContainer removeObjectsForKeys:unloadingKeys];
}

#pragma mark - getter and setter

- (NSMutableDictionary *)serviceContainer
{
    if (_serviceContainer)
    {
        return _serviceContainer;
    }
    
    _serviceContainer = [NSMutableDictionary dictionary];
    return _serviceContainer;
}

@end
