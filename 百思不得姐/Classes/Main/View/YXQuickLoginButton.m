
//
//  YXQuickLoginButton.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/8.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXQuickLoginButton.h"

@implementation YXQuickLoginButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.YX_y = 0;
    self.imageView.YX_centerX = self.YX_width * 0.5;
    self.titleLabel.frame = CGRectMake(0,self.imageView.YX_height, self.YX_width, self.YX_height - self.imageView.YX_height);
}

@end
