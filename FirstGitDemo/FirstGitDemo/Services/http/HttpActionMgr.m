//
//  HttpActionMgr.m
//  FirstGitDemo
//
//  Created by 李康 on 15/6/18.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import "HttpActionMgr.h"

static HttpActionMgr *sharedMgr = nil;

@interface HttpActionMgr ()

@property (nonatomic,strong) AFHTTPRequestOperationManager *httpRequestMgr;
@end

@implementation HttpActionMgr


- (NSString *)getBaseURLString{
    return [NSString stringWithFormat:@"http://www.baidu.com"];
}
- (AFHTTPRequestOperationManager *)getHttpRequstMgr{
    
    return self.httpRequestMgr;
}
+(id)shared{
    
    if (!sharedMgr) {
        sharedMgr = [[self alloc]init];
        NSURL *url = [NSURL URLWithString:[sharedMgr getBaseURLString]];
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedMgr.httpRequestMgr = manager;
    }
    return self;
}
/**
 *  清除缓存
 */
- (void)ClearCookies{
    NSURL *base_url = [NSURL URLWithString:[sharedMgr getBaseURLString]];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:base_url];
    for (NSHTTPCookie *cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}
- (void)ClearCookie{
    NSURL *base_url = [NSURL URLWithString:[sharedMgr getBaseURLString]];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:base_url];
    for (NSHTTPCookie *cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}
@end
