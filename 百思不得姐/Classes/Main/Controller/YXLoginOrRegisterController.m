 //
//  YXLoginOrRegisterController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/8.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXLoginOrRegisterController.h"

@interface YXLoginOrRegisterController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;

@end

@implementation YXLoginOrRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark   调整状态栏文字颜色
#pragma ----------------------------
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark   按钮处理
#pragma ----------------------------
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)LoginOrRegister:(UIButton *)btn {
    [self.view endEditing:YES];
    if (self.leftConstraint.constant) {
        self.leftConstraint.constant = 0;
        btn.selected = NO;
    }else
    {
        self.leftConstraint.constant = - self.view.YX_width;
        btn.selected = YES;
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];

    
}
- (IBAction)loginBtnClick:(id)sender {
}
- (IBAction)registerBtnClick:(id)sender {
}

@end
