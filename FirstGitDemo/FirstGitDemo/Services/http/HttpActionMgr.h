//
//  HttpActionMgr.h
//  FirstGitDemo
//
//  Created by 李康 on 15/6/18.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpActionMgr : NSObject

/**
 *  获得单利实例
 *
 *  @return 返回单利对象
 */
+(id)shared;

/**
 *  获取Http对象
 *
 *  @return <#return value description#>
 */
- (AFHTTPRequestOperationManager *)getHttpRequstMgr;

@end
