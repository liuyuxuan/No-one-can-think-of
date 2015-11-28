//
//  YXFollowController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXFollowController.h"
#import "YXLoginOrRegisterController.h"
@interface YXFollowController ()

@end

@implementation YXFollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
   
}

#pragma mark   设置导航栏
#pragma ----------------------------
- (void)setNavigationItem
{
    //标题
    UILabel *title = [[UILabel alloc]init];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:20];
    title.text = @"我的关注";
    [title sizeToFit];
    self.navigationItem.titleView = title;
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightedImage:@"friendsRecommentIcon-click" target:self action:@selector(leftBarButtonClick)];
}

- (void)leftBarButtonClick
{
    YXLogFun
}
#pragma mark   登陆注册按钮处理
#pragma ----------------------------
- (IBAction)loginOrRegister:(id)sender {
    [self presentViewController:[[YXLoginOrRegisterController alloc]init] animated:YES completion:nil];
}

@end
