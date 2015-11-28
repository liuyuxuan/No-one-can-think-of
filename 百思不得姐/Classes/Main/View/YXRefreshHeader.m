//
//  YXRefreshHeader.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/21.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXRefreshHeader.h"

@implementation YXRefreshHeader

- (void)prepare
{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor redColor];
    self.stateLabel.textColor = [UIColor redColor];
    [self setTitle:@"下拉" forState:MJRefreshStateIdle];
    [self setTitle:@"松开" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
}

@end
