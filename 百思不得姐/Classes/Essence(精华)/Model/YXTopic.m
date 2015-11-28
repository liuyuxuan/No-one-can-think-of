//
//  YXTopic.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/19.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopic.h"
#import "NSCalendar+YXExtension.h"
#import "NSDate+YXExtension.h"
#import "YXComment.h"
#import "YXUser.h"
@implementation YXTopic
static NSDateFormatter *fmt_;
static NSCalendar *cdr_;
+ (void)initialize
{
    fmt_ = [[NSDateFormatter alloc]init];
    cdr_ = [NSCalendar calendar];
}


- (NSString *)created_at
{
    
    fmt_.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *curDate = [fmt_ dateFromString:_created_at];
    if (curDate.isThisYear) {  //今年
        
        if (curDate.isToday) {  //今天
            
            NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute;
            
            NSDateComponents *comp =  [cdr_ components:unit fromDate:curDate toDate:[NSDate date] options:0];
            if (comp.hour > 1) {
                
                return [NSString stringWithFormat:@"%zd小时前",comp.hour];
            }else if (comp.minute > 1) {
                
                return [NSString stringWithFormat:@"%zd分钟前",comp.minute];
            }else
            {
                return @"刚刚";
            }
            
        }else if (curDate.isYesterday) {  //昨天
            fmt_.dateFormat = @"昨天 HH:mm:ss";
            return [fmt_ stringFromDate:curDate];
        }else{
            fmt_.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt_ stringFromDate:curDate];
        }
        
        
    }else       //不是今年
    {
        return _created_at;
    }
    
}

- (CGFloat)cellHeight
{
    if (_cellHeight != 0) return _cellHeight;
    //1.头像高度
    _cellHeight = 35 + YXMargin * 2;
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * YXMargin;
    //2.文字
    CGSize maxSize = CGSizeMake(textMaxW, MAXFLOAT);
    
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + YXMargin;
    //3.中间内容
    if (self.type != YXTopicTypeWord) {  //不是文字
        CGFloat contentH =textMaxW *self.height / self.width;
        if (contentH >= [UIScreen mainScreen].bounds.size.height) {
            contentH =200;
            self.bigPicture = YES;
        }
        self.contentF = CGRectMake(YXMargin, _cellHeight, textMaxW, contentH);
        _cellHeight += contentH + YXMargin;
    }
      //4.热评
    if (self.top_cmt) {
        _cellHeight += 20;
        NSString *topText = [NSString stringWithFormat:@"%@ : %@",self.top_cmt.user.username,self.top_cmt.content];
         CGSize topTextSize = [topText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
        _cellHeight += topTextSize.height + YXMargin;
    }
    //5.底部条
    _cellHeight += 35 + YXMargin;
    return _cellHeight;
}

@end
