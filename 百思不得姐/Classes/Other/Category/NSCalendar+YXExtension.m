//
//  NSCalendar+YXExtension.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/22.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "NSCalendar+YXExtension.h"

@implementation NSCalendar (YXExtension)

+ (instancetype)calendar
{
    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }else
    {
        return [NSCalendar currentCalendar];
    }
}
@end
