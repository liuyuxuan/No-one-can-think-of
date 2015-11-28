//
//  UIBarButtonItem+YXBarButtonItem.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "UIBarButtonItem+YXBarButtonItem.h"

@implementation UIBarButtonItem (YXBarButtonItem)

+ (instancetype)itemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}

@end
