//
//  YXComment.h
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/21.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YXUser;
@interface YXComment : NSObject
/** 内容 */
@property (nonatomic, copy) NSString *content;
/** 用户(发表评论的人) */
@property (nonatomic, strong) YXUser *user;
@end
