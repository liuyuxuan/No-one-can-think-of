//
//  YXLoginTextField.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/9.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXLoginTextField.h"
//#import <objc/runtime.h>
@implementation YXLoginTextField

- (void)awakeFromNib
{
//   unsigned int count;
//   Ivar *vars = class_copyIvarList([UITextField class], &count);
//    for (int i = 0; i < count; i++) {
//        Ivar var = vars[i];
//        YXLog(@"%s",ivar_getName(var));
//    }
    self.textColor = [UIColor whiteColor];
}


- (BOOL)becomeFirstResponder
{
    self.placeholderColor = [UIColor whiteColor];
  return  [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    self.placeholderColor = [UIColor grayColor];
    return [super resignFirstResponder];
}
@end
