//
//  HLQService.m
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "HLQService.h"

#import <libkern/OSAtomic.h>
#import "HLQBaseRequest.h"

@interface HLQService ()

@property (nonatomic, assign) OSSpinLock spinLock;
@property (nonatomic, assign) NSInteger requestFinishCount;


@end

@implementation HLQService

#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.spinLock = OS_SPINLOCK_INIT;
    }
    return self;
}

#pragma mark - public

+ (NSString *)serviceName
{
    return NSStringFromClass(self.class);
}

- (BOOL)needUnloading
{
    BOOL need = (0 == self.requestFinishCount);
    return need;
}

- (void)startRequest:(HLQBaseRequest *)request
           otherInfo:(id)otherInfo
{
    [self recordRequestFinishCount:-1];
    
    [request startWithCompletionBlockWithSuccess:^(HLQBaseRequest *request)
     {
         id object = [request currentResponseModel];
         
         if (request.networkSuccessResponse) {
             request.networkSuccessResponse(object, otherInfo);
         }
         [self recordRequestFinishCount:1];
         
     }failure:^(HLQBaseRequest *request)
     {
         id object = request.requestOperation.error;
         if (request.networkFailResponse) {
             request.networkFailResponse(object, otherInfo);
         }
         [self recordRequestFinishCount:1];
     }];
    
}

- (void)recordRequestFinishCount:(NSInteger)count_
{
    OSSpinLockLock(&_spinLock);
    
    self.requestFinishCount = self.requestFinishCount + count_;
    
    OSSpinLockUnlock(&_spinLock);
}


@end
