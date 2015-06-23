//
//  ActionBase.m
//  FirstGitDemo
//
//  Created by 李康 on 15/6/18.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import "ActionBase.h"

@interface ActionBase ()

@property (nonatomic,strong) NSString *url;

@end

@implementation ActionBase

- (id)initWithUrlString:(NSString *)url{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}
- (NSString *)get_action_url{

    return self.url;
    
}
- (BOOL)DoActionWithSuccess:(ActionSuccessBlocks)success Failure:(ActionFailureBlocks)failure
{
    
    assert(0);
    
}
@end

/**
 *  GET 基础类
 */
@implementation GetActionBase

- (BOOL)DoActionWithSuccess:(ActionSuccessBlocks)success Failure:(ActionFailureBlocks)failure{
    
    AFHTTPRequestOperationManager *httprequest = [[HttpActionMgr shared] getHttpRequstMgr];
    
    [httprequest GET:[self get_action_url] parameters:self.parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(self,operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(self,operation,error);
        
    }];
    return YES;
}

@end

/**
 *  POST 基础类
 */
@implementation PostActionBase

- (BOOL)DoActionWithSuccess:(ActionSuccessBlocks)success Failure:(ActionFailureBlocks)failure{
    
    AFHTTPRequestOperationManager *httprequest = [[HttpActionMgr shared]getHttpRequstMgr];
    
    [httprequest POST:[self get_action_url] parameters:self.parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(self,operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(self,operation,error);
    }];
    return YES;
}

@end

@implementation SingleImageActionBase

- (id)initWithUrlString:(NSString *)url{
    self = [super initWithUrlString:url];
    if (self) {
        self.upload_image_param_name = @"photo";
        self.upload_image_max_size = CGSizeZero;
    }
    
    return self;
}
- (BOOL)DoActionWithSuccess:(ActionSuccessBlocks)success Failure:(ActionFailureBlocks)failure{
    AFHTTPRequestOperationManager *httprequest = [[HttpActionMgr shared]getHttpRequstMgr];
    
    
    if (!httprequest) {
        return NO;
    }
    NSURL *file_url = nil;
    if (self.upload_image) {
        file_url = [LZUnity  createTempImageUploadFile:self.upload_image];
    }

    [httprequest POST:[self get_action_url] parameters:self.parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (file_url) {
        [formData appendPartWithFileURL:file_url name:self.upload_image_param_name error:nil];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(self,operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(self,operation,error);
    }];
    return YES;
}

@end












