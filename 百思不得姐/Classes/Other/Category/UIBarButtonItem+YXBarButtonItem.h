//
//  UIBarButtonItem+YXBarButtonItem.h
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YXBarButtonItem)
+ (instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;
@end
