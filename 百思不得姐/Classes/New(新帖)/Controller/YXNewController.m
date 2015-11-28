//
//  YXNewController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXNewController.h"

@interface YXNewController ()

@end

@implementation YXNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
}

#pragma mark   设置导航栏
#pragma ----------------------------
- (void)setNavigationItem
{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightedImage:@"MainTagSubIconClick" target:self action:@selector(leftBarButtonClick)];
}

- (void)leftBarButtonClick
{
    YXLogFun
}


@end
