//
//  HLQBaseModel.h
//  HLQSeviceDemo
//
//  Created by myq on 16/7/20.
//  Copyright © 2016年 helaiquan. All rights reserved.
//

#import "YYModel.h"

@interface HLQBaseModel : NSObject

/// common model parameter
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *desc;

/// the value for "result" key is array
@property (nonatomic, strong) NSArray *responseResultList;

/// the value for "result" key is string
@property (nonatomic, copy) NSString *responseResultString;

/// convert model func
+ (id)convertToModel:(id)JSONString;


@end
