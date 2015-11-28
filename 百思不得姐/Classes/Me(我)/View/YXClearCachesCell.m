//
//  YXClearCachesCell.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/17.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#define YXCachesFilePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"YXCustom"]

#import "YXClearCachesCell.h"
#import "NSString+YXExtension.h"
#import <SDImageCache.h>

@implementation YXClearCachesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textLabel.text = @"清除缓存(正在计算中...)";
        self.userInteractionEnabled = NO;
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicatorView startAnimating];
        self.accessoryView = indicatorView;
        
        __weak typeof(self) weakSelf = self;
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            unsigned long long size = YXCachesFilePath.fileSize;
            [NSThread sleepForTimeInterval:5];
            size += [SDImageCache sharedImageCache].getSize;
            
            if (!weakSelf) return ;
            
            NSString *sizeText = nil;
            if (size >= pow(10, 9)) {
                sizeText = [NSString stringWithFormat:@"%.2fGB",size/pow(10, 9)];
            }else if (size >= pow(10, 6)) {
                sizeText = [NSString stringWithFormat:@"%.2fMB",size/pow(10, 6)];
            }else if (size >= pow(10, 3)) {
                sizeText = [NSString stringWithFormat:@"%.2fKB",size/pow(10, 3)];
            }else
            {
                sizeText = [NSString stringWithFormat:@"%lluB",size];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.textLabel.text = [NSString stringWithFormat:@"清除缓存(%@)",sizeText];
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                weakSelf.userInteractionEnabled = YES;
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:weakSelf action:@selector(cellClick)]];
                
            });
            
        });
        
        
        
    }
    return self;
}

- (void)cellClick
{
//    YXLogFun
//    YXLog(@"%@",NSHomeDirectory());
    [SVProgressHUD showInfoWithStatus:@"正在清除缓存" maskType:SVProgressHUDMaskTypeBlack];
    
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
      dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSFileManager *mgr = [NSFileManager defaultManager];
          [mgr removeItemAtPath:YXCachesFilePath error:nil];
          [mgr createDirectoryAtPath:YXCachesFilePath withIntermediateDirectories:YES attributes:nil error:nil];
          
          dispatch_async(dispatch_get_main_queue(), ^{
              [SVProgressHUD dismiss];
              self.textLabel.text = @"清除缓存(0KB)";
          });
          
          
      });
        
        
    }];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIActivityIndicatorView *indicatorView =(UIActivityIndicatorView *) self.accessoryView;
    [indicatorView startAnimating];

}


@end
