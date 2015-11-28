//
//  NSString+YXExtension.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/17.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "NSString+YXExtension.h"

@implementation NSString (YXExtension)

- (unsigned long long)fileSize
{
    unsigned long long size = 0;
    
   NSFileManager *mgr = [NSFileManager defaultManager];
    //是否文件夹
    BOOL isDirectory = NO;
    //路径是否存在
   BOOL isExists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!isExists) return size;
    
    if (isDirectory) {
        
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subPath in enumerator) {
            NSString *path = [self stringByAppendingPathComponent:subPath];
            size += [mgr attributesOfItemAtPath:path error:nil].fileSize;
        }
    }else
    {
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

@end
