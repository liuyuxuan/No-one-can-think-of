//
//  YXTopicVideoView.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/23.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopicVideoView.h"
#import <UIImageView+WebCache.h>
#import "YXTopic.h"
@interface YXTopicVideoView()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *numberLab;

@end
@implementation YXTopicVideoView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(YXTopic *)topic
{
    _topic = topic;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    self.numberLab.text = [NSString stringWithFormat:@"%zd",topic.playcount];
    self.timeLab.text = [NSString stringWithFormat:@"%02zd:%02zd",topic.videotime / 60,topic.videotime % 60];
}

@end
