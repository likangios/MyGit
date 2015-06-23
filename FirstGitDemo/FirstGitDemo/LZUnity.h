//
//  LZUnity.h
//  FirstGitDemo
//
//  Created by 哈哈哈 on 15/6/22.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZUnity : NSObject
//随机字符串
+(NSString *)randomStringWithLength:(int)len;
//图片缓存
+ (NSURL *)createTempImageUploadFile:(UIImage *)image;

@end
