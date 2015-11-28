//
//  UITextField+YXExtension.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/9.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//


#import "UITextField+YXExtension.h"

static NSString * const placeholderColorPath = @"placeholderLabel.textColor";
@implementation UITextField (YXExtension)

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
  //让系统自动创建占位文字对象
    NSString *placeStr = self.placeholder;
    self.placeholder = @"sb";
    self.placeholder = placeStr;
    
    if (placeholderColor == nil) {
        placeholderColor = [UIColor grayColor];
    }
    
    [self setValue:placeholderColor forKeyPath:placeholderColorPath];
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:placeholderColorPath];
}
@end
