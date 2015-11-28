//
//  YXTopicPictureView.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/23.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopicPictureView.h"
#import "YXTopic.h"
#import <UIImageView+WebCache.h>
#import <AFNetworking.h>
#import <DALabeledCircularProgressView.h>
#import "YXseeBigController.h"
@interface YXTopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIImageView *gif_img;
@property (weak, nonatomic) IBOutlet UIButton *seebig_btn;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressV;

@end

@implementation YXTopicPictureView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progressV.progressLabel.textColor = [UIColor whiteColor];
    self.progressV.roundedCorners = 5;
    self.imageV.userInteractionEnabled = YES;
    [self.imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seeBigBtnClick:)]];
}

- (void)setTopic:(YXTopic *)topic
{
    _topic = topic;
#warning 显示的是大图
    [self.imageV sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:topic.large_image] andPlaceholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressV.hidden = NO;
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        self.progressV.progress = progress;
        self.progressV.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",progress * 100];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.progressV.hidden = YES;
    }];
    self.gif_img.hidden = !topic.is_gif;
    
    //如果是大图
    if (topic.isBigPicture) {
        self.seebig_btn.hidden = NO;
        self.imageV.contentMode = UIViewContentModeTop;
        self.imageV.clipsToBounds = YES;
    }else
    {
        self.seebig_btn.hidden = YES;
        self.imageV.contentMode = UIViewContentModeScaleToFill;
        self.imageV.clipsToBounds = NO;
    }
    
}


- (IBAction)seeBigBtnClick:(id)sender {
    YXseeBigController *seeBigVc = [[YXseeBigController alloc]init];
    seeBigVc.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:seeBigVc animated:YES completion:nil];
}

@end
