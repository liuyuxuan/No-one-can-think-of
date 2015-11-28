//
//  YXNavigationController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/6.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXNavigationController.h"

@interface YXNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation YXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"navigationbarBackgroundWhite"];
    self.interactivePopGestureRecognizer.delegate = self;
}
#pragma mark   重写push方法
#pragma ----------------------------
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //添加返回按钮
    if (self.childViewControllers.count) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        
        //隐藏Tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    YXLogFun
}

#pragma mark   监听手势
#pragma ----------------------------
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}
@end
