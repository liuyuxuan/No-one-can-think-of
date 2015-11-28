//
//  NSDate+YXExtension.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/22.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "NSDate+YXExtension.h"
#import "NSCalendar+YXExtension.h"
@implementation NSDate (YXExtension)

- (BOOL)isThisYear
{
    NSCalendar *cdr = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear;
    
    NSInteger selfYear = [cdr component:unit fromDate:self];
    NSInteger nowYear = [cdr component:unit fromDate:[NSDate date]];
    
    return selfYear == nowYear;
}

- (BOOL)isToday
{
    NSCalendar *cdr = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
     NSDateComponents *selfCmt = [cdr components:unit fromDate:self];
     NSDateComponents *nowCmt = [cdr components:unit fromDate:[NSDate date]];
    return selfCmt.year == nowCmt.year &&
           selfCmt.month == nowCmt.month &&
           selfCmt.day == nowCmt.day;
}


- (BOOL)isYesterday
{
    NSCalendar *cdr = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
   NSDateComponents *comp = [cdr components:unit fromDate:self toDate:[NSDate date] options:0];
    
    return comp.year == 0 &&
            comp.month == 0 &&
    comp.day == 1;
}

- (BOOL)isTomorrow
{
    NSCalendar *cdr = [NSCalendar calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *comp = [cdr components:unit fromDate:self toDate:[NSDate date] options:0];
    
    return comp.year == 0 &&
    comp.month == 0 &&
    comp.day == -1;
}
@end
