//
//  LZUnity.m
//  FirstGitDemo
//
//  Created by 哈哈哈 on 15/6/22.
//  Copyright (c) 2015年 Luck. All rights reserved.
//

#import "LZUnity.h"

@implementation LZUnity
NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+(NSString *)randomStringWithLength:(int)len{

    NSMutableString *muStr = [NSMutableString stringWithCapacity:len];
    for (int i = 0; i<len; i++) {
        [muStr appendFormat:@"%C",[letters characterAtIndex:arc4random_uniform(letters.length)]];
    }
    return muStr;
}

+ (NSURL *)createTempImageUploadFile:(UIImage *)image{
    NSURL *image_url;
    NSString *image_name = [LZUnity randomStringWithLength:32];
    
    NSString *imagePath = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%f_.jpg",image_name,[NSDate timeIntervalSinceReferenceDate]]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath isDirectory:nil]) {
        [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
        
    }
    NSData *imageData =UIImageJPEGRepresentation(image, 0.8f);
    
    image_url = [NSURL fileURLWithPath:imagePath];
    
    return image_url;
    
}
@end
