//
//  NSDate+YXExtension.h
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/22.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YXExtension)

/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;

/**
 *  是否为明天
 */
- (BOOL)isTomorrow;

@end
