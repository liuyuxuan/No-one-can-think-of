//
//  YXExtensionConflg.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/21.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXExtensionConflg.h"
#import <MJExtension.h>
#import "YXTopic.h"
@implementation YXExtensionConflg

+ (void)load
{
    [YXTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"top_cmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1"};
    }];
}

@end
