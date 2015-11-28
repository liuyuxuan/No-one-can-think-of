//
//  YXTabBar.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/6.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTabBar.h"


@interface YXTabBar()

@property (nonatomic,weak)UIButton *centerBtn;
@end

@implementation YXTabBar
#pragma mark   lazy load
#pragma ----------------------------
- (UIButton *)centerBtn
{
    if (!_centerBtn) {
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [centerBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [centerBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [centerBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerBtn];
        _centerBtn = centerBtn;
    }
    return _centerBtn;
}
#pragma mark   布局子控件
#pragma ----------------------------

- (void)layoutSubviews
{
    [super layoutSubviews];
    //修改子控件位置
    CGFloat buttonW = self.YX_width / 5;
    CGFloat buttonH = self.YX_height;
    CGFloat buttonX = 0;
    CGFloat ButtonY = 0;
    int buttonIndex = 0;
    for (UIView *childView in self.subviews) {
        if (childView.class == NSClassFromString(@"UITabBarButton")) {
            buttonX = buttonIndex * buttonW;
            if (buttonIndex>=2) {
                buttonX += buttonW;
            }
            childView.frame = CGRectMake(buttonX, ButtonY, buttonW, buttonH);
            buttonIndex ++;
        }
    }
    //给中心按钮设置尺寸
    self.centerBtn.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.centerBtn.center = CGPointMake(self.YX_width * 0.5, self.YX_height * 0.5);
   
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}
#pragma mark   按钮点击
#pragma ----------------------------
- (void)BtnClick
{
    YXLogFun
}

@end
