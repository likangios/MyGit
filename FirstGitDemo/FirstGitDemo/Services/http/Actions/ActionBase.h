//
//  ActionBase.h
//  FirstGitDemo
//
//  Created by 李康 on 15/6/18.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpActionMgr.h"

@class ActionBase;

typedef void(^ActionSuccessBlocks)(ActionBase *action,AFHTTPRequestOperation *operation,id responseObject);

typedef void(^ActionFailureBlocks)(ActionBase *action,AFHTTPRequestOperation *operation,NSError *error);

/**
 *  HTTP请求 基础类
 */
@interface ActionBase : NSObject

@property (nonatomic,strong) NSDictionary *parameter;

- (id)initWithUrlString:(NSString *)url;

- (BOOL)DoActionWithSuccess:(ActionSuccessBlocks)success Failure:(ActionFailureBlocks)failure;

@end
/**
 *  GET 基础类
 */
@interface GetActionBase : ActionBase

@end
/**
 *  POST 基础类
 */
@interface PostActionBase : ActionBase

@end

@interface SingleImageActionBase : ActionBase

@property (nonatomic,strong) NSString *upload_image_param_name;

@property (nonatomic,strong) UIImage *upload_image;

@property (nonatomic,assign) CGSize upload_image_max_size;

@end
